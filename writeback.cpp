//
//  writeback.cpp
//  def
//
//  Created by Arda Yurdakul on 15/11/2018.
//  Copyright © 2018 Arda Yurdakul. All rights reserved.
//

#include "cache.hpp"

// Writes a block from cache into memory
void writeback_block(data_type lowermem[CACHE_WIDTH], data_type highermem[HMEMSIZE],address_type address)
{
#ifdef TRYBURST
#pragma HLS INTERFACE mode=m_axi port=lowermem depth=CACHE_WIDTH offset=slave
#pragma HLS INTERFACE mode=m_axi port=highermem depth=CACHE_WIDTH offset=direct
#pragma HLS interface mode=s_axilite port=lowermem
#pragma HLS interface mode=s_axilite port=highermem
#pragma HLS PIPELINE off
	memcpy(&highermem[address],lowermem , CACHE_WIDTH*sizeof(data_type));
#else
    address_type i;

    for (i=0;i<CACHE_WIDTH;i++)
    {
            highermem[address+i]=lowermem[i];
    }
#endif
}
