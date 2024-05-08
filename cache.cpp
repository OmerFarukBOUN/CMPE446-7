#include "cache.hpp"

#ifdef NEW

#ifndef EASYCOSIM
data_type cache_access(address_type address, data_type value, bool action,
		data_type mymem[HMEMSIZE])
#else
data_type cache_access(address_type address, data_type value, bool action,
		data_type mymem[HMEMSIZE], data_type test_value)
#endif
{
	address_type tagindex, fetch_address, writeback_address;
	tag_type tag;
	index_type index;
	offset_type offset;
	data_type ret_value;
	identifier_type cache_index;
	identifier_type zerod;
	identifier_type oned;
	one_bit not_in_cache;
	static one_bit cache_valid[CACHE_DEPTH] = { 0 };
	static one_bit cache_dirty[CACHE_DEPTH] = { 0 };
	static one_bit set_old[NOF_SET] = { 0 };
	static tag_type cache_tag[CACHE_DEPTH];
	static data_type cache[CACHE_DEPTH][CACHE_WIDTH];

#ifdef TRYBURST
#pragma HLS array_partition variable=cache type=complete
#pragma HLS INLINE off
#pragma HLS PIPELINE off
#endif

	tagindex = (address_type) (address >> OFFSET_SIZE);
	tag = (tag_type) (tagindex >> INDEX_SIZE);
	index = (index_type) (tagindex & ((1 << INDEX_SIZE) - 1));
	offset = (offset_type) (address & ((1 << OFFSET_SIZE) - 1));
	fetch_address = (address_type) (address - offset);
	zerod = (identifier_type) index << SET_SIZE;
	oned = (identifier_type) index << SET_SIZE | 1;

	// Check if the current address is in the cache
	if (cache_tag[zerod] == tag) {
		cache_index = zerod;
		not_in_cache = (one_bit) 0;
	} else if (cache_tag[oned] == tag) {
		cache_index = oned;
		not_in_cache = (one_bit) 0;
	} else {
		// Since it is not in the cache, replace the current adress's block with the oldest block in the set
		cache_index = (identifier_type) (zerod | set_old[index]);
		set_old[index] = (one_bit) (1 ^ set_old[index]);
		not_in_cache = (one_bit) 1;
	}

	// Check if we need to fetch&dump the current address's block from memory into cache
	if (cache_valid[cache_index] == NO || not_in_cache) {
		if (cache_dirty[cache_index] == YES) {
			// If we have written on the block which is getting replaced, we need to write it back on the memory
			writeback_address = ((((address_type) (cache_tag[cache_index])
					<< INDEX_SIZE) + index) << OFFSET_SIZE);
			writeback_block(cache[cache_index], mymem, writeback_address);
		}
		// Initialize the block in the cache
		fetch_block(cache[cache_index], mymem, fetch_address);
		cache_dirty[cache_index] = (one_bit) NO;
		cache_valid[cache_index] = (one_bit) YES;
		cache_tag[cache_index] = tag;
	}
	if (action == READ) {
		// Read the value on the given address
		ret_value = cache[cache_index][offset];
	} else {
		// Write the value to the given address
		ret_value = cache[cache_index][offset] = value;
		cache_dirty[cache_index] = (one_bit) YES;
	}
#ifndef EASYCOSIM
	return ret_value;
#else
	// The last part added in order to Vitis to open up the test_value port
	return ret_value|(test_value==0);
#endif
}

#else

data_type cache_access(address_type address, data_type value, bool action, data_type mymem[HMEMSIZE])
{
    address_type tagindex, fetch_address, writeback_address;
	tag_type tag;
    index_type index;
    offset_type offset;
    data_type ret_value;
    static bool cache_valid[CACHE_DEPTH]={0};
    static bool cache_dirty[CACHE_DEPTH]={0};
    static tag_type cache_tag[CACHE_DEPTH];
    static data_type cache[CACHE_DEPTH][CACHE_WIDTH];


    tagindex=(address>>OFFSET_SIZE);
    tag=tagindex>>INDEX_SIZE;
    index=tagindex&((1<<INDEX_SIZE)-1);
    offset=(address&((1<<OFFSET_SIZE)-1));
    fetch_address=address-offset;

    // Check if we need to fetch&dump the current address's block from memory into cache
    if(cache_valid[index]==NO || cache_tag[index]!=tag)
    {
       if(cache_dirty[index]==YES)
        {
			// If we have written on the block which is getting replaced, we need to write it back on the memory
            writeback_address= (((address_type)(cache_tag[index])<<INDEX_SIZE)+ index)<<OFFSET_SIZE;
        	writeback_block(cache[index],mymem,writeback_address);
        }
        // Initialize the block in the cache
        fetch_block(cache[index],mymem, fetch_address);
        cache_dirty[index]=NO;
        cache_valid[index]=YES;
        cache_tag[index]=tag;
    }
    if(action == READ)
    {
    	// Read the value on the given address
    	ret_value= cache[index][offset];
    }
    else
    {
		// Write the value to the given address
        ret_value = cache[index][offset] = value;
        cache_dirty[index]=YES;
    }
    return ret_value;
}

#endif
