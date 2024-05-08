//
//  fetch_block.cpp
//  def
//
//  Created by Arda Yurdakul on 15/11/2018.
//  Copyright © 2018 Arda Yurdakul. All rights reserved.
//

#include "cache.hpp"

// Writes a block from memory to cache
void fetch_block(data_type lowermem[CACHE_WIDTH], data_type highermem[HMEMSIZE], address_type address)
{
#ifdef TRYBURST
#pragma HLS INTERFACE mode=m_axi port=lowermem depth=CACHE_WIDTH
#pragma HLS INTERFACE mode=m_axi port=highermem depth=CACHE_WIDTH
#pragma HLS interface mode=s_axilite port=lowermem
#pragma HLS interface mode=s_axilite port=highermem
#pragma HLS PIPELINE off
	memcpy(lowermem, &highermem[address], CACHE_WIDTH*sizeof(data_type));
#else
    address_type i;

    for (i=0;i<CACHE_WIDTH;i++)
    {
        lowermem[i]=highermem[address+i];
    }
#endif
}

