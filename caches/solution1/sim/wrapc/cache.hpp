#pragma once
#define NEW
// #define FIRSTTEST
#define EASYCOSIM
//#define TRYBURST

#include <stdio.h>
#include <cmath>
#include "ap_fixed.h"
#include <string.h>

#ifdef NEW

// The values can be changed for implementing 2-way associate caches
#define ADDRESS_SIZE 11
#define TAG_SIZE 3
#define INDEX_SIZE 2
//////////////////

#define SET_SIZE 1
#define OFFSET_SIZE (ADDRESS_SIZE - INDEX_SIZE - TAG_SIZE)
#define NOF_SET (1<<INDEX_SIZE)
#define CACHE_DEPTH (1<<(INDEX_SIZE+SET_SIZE))
#define CACHE_WIDTH (1<<OFFSET_SIZE)
#define HMEMSIZE (1<<ADDRESS_SIZE)
#ifndef __SYNTHESIS__
#define __SYNTHESIS__
#endif

enum{NO,YES};
enum{WRITE,READ};


#ifndef __SYNTHESIS__
typedef unsigned int address_type;
typedef unsigned int tag_type;
typedef unsigned int index_type;
typedef unsigned int offset_type;
typedef unsigned int identifier_type;
typedef bool one_bit;
typedef int data_type;;
#endif

#ifdef __SYNTHESIS__
typedef ap_uint<ADDRESS_SIZE> address_type;
typedef ap_uint<TAG_SIZE> tag_type;
typedef ap_uint<INDEX_SIZE> index_type;
typedef ap_uint<OFFSET_SIZE> offset_type;
typedef ap_uint<INDEX_SIZE+SET_SIZE> identifier_type;
typedef ap_uint<1> one_bit;
typedef int32_t data_type;
#endif



extern data_type mymem[HMEMSIZE];
#ifndef EASYCOSIM
data_type cache_access(address_type address, data_type value, bool action,data_type mymem[HMEMSIZE]);
#else
data_type cache_access(address_type address, data_type value, bool action,data_type mymem[HMEMSIZE], data_type test_value);
#endif
void fetch_block(data_type lowermem[CACHE_WIDTH], data_type highermem[HMEMSIZE], address_type address);
void writeback_block(data_type lowermem[CACHE_WIDTH], data_type highermem[HMEMSIZE],address_type address);


#else

// The values can be changed for implementing directly mapped caches
#define ADDRESS_SIZE 11
#define TAG_SIZE 2
#define INDEX_SIZE 3
///////////////////

#define OFFSET_SIZE (ADDRESS_SIZE - INDEX_SIZE - TAG_SIZE)
#define CACHE_DEPTH (1<<INDEX_SIZE)
#define CACHE_WIDTH (1<<OFFSET_SIZE)
#define HMEMSIZE (1<<ADDRESS_SIZE)
#define __SYNTHESIS__

enum{NO,YES};
enum{WRITE,READ};


#ifndef __SYNTHESIS__
typedef unsigned int address_type;
typedef unsigned int tag_type;
typedef unsigned int index_type;
typedef unsigned int offset_type;
typedef bool one_bit;
typedef int data_type;;
#endif

#ifdef __SYNTHESIS__
typedef ap_uint<ADDRESS_SIZE> address_type;
typedef ap_uint<TAG_SIZE> tag_type;
typedef ap_uint<INDEX_SIZE> index_type;
typedef ap_uint<OFFSET_SIZE> offset_type;
typedef ap_uint<1> one_bit;
typedef int32_t data_type;
#endif



extern data_type mymem[HMEMSIZE];

data_type cache_access(address_type address, data_type value, bool action,data_type mymem[HMEMSIZE]);
void fetch_block(data_type lowermem[CACHE_WIDTH], data_type highermem[HMEMSIZE], address_type address);
void writeback_block(data_type lowermem[CACHE_WIDTH], data_type highermem[HMEMSIZE],address_type address);

#endif
