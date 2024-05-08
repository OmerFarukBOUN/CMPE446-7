//
//  main.cpp
//  def
//
//  Created by Arda Yurdakul on 14/11/2018.
//  Copyright © 2018 Arda Yurdakul. All rights reserved.
//

#include <iostream>
#include "cache.hpp"

using namespace std;

// Used for storing data into memory without having calculation problems
union flt2int {
	float flt;
	data_type bitarr;
};

// The memory
data_type mymem[HMEMSIZE];

// Used for debug purposes
union flt2int checker[HMEMSIZE];

int main(void) {
#ifdef FIRSTTEST
	data_type ivalue, value;
	address_type address, i;

	std::cout << CACHE_DEPTH << ", " << CACHE_WIDTH << "\n";

	// Write some predictable values on memory
	for (i = 0; i < HMEMSIZE - 1; i++) {
		mymem[i] = i % 0x100;
		printf("(%X,%X)\n", (uint32_t) i, mymem[i]);
	}

	// Change some of them
	for (i = 0; i < 200; i++) {
		address = rand() % HMEMSIZE;
		value = rand() % 0x100;
		printf("before: %x %x\n", (uint32_t) address, value);
		cache_access(address, value, WRITE, mymem);
		ivalue = cache_access(address, value, READ, mymem);
		printf("after: %x %x %x \n", (uint32_t) address, value, ivalue);
	}

	// Now check if they are really changed
	for (i = 0; i < HMEMSIZE - 1; i++) {
		printf("(%X,%X)\n", (uint32_t) i, cache_access(i, value, READ, mymem));
	}
	return 0;

#else

	const int M = 26;
	float a[M][M];
	float b[M][M];
	float c[M][M];

	union flt2int random1;
	union flt2int random2;

	// Write some random floating values on memory
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < M; j++) {
			random1.flt = (float) (rand()) / (float) (rand());
			random2.flt = (float) (rand()) / (float) (rand());
			a[i][j] = random1.flt;
			b[i][j] = random2.flt;
			mymem[i * M + j] = random1.bitarr;
			mymem[M * M + i * M + j] = random2.bitarr;
			checker[i * M + j].bitarr = random1.bitarr;
			checker[M * M + i * M + j].bitarr = random2.bitarr;
		}
	}

	// Do the matrix multiplication
	union flt2int ctrl_val;
	union flt2int real_val;
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < M; j++) {
			real_val.flt = 0;
			ctrl_val.flt = 0;
			// Calculate the value of each element in the result matrix
			for (int k = 0; k < M; k++) {
				real_val.flt += a[i][k] * b[k][j];
#ifndef EASYCOSIM
				random1.bitarr = cache_access(i * M + k, 0, READ, mymem);
				random2.bitarr = cache_access(M * M + k * M + j, 0, READ,
						mymem);
#else
				random1.flt = a[i][k];
				random2.flt = b[k][j];
				random1.bitarr = cache_access(i * M + k, 0, READ, mymem,
						random1.bitarr);
				random2.bitarr = cache_access(M * M + k * M + j, 0, READ, mymem,
						random2.bitarr);
#endif
				ctrl_val.flt += random1.flt * random2.flt;
				if (real_val.flt != ctrl_val.flt) {
					cout << i << ", " << j << ", " << k << endl;
				}
			}
			// Store the result
			c[i][j] = real_val.flt;
#ifndef EASYCOSIM
			cache_access(2 * M * M + i * M + j, ctrl_val.bitarr, WRITE, mymem);
#else
			cache_access(2 * M * M + i * M + j, ctrl_val.bitarr, WRITE, mymem,
					real_val.bitarr);
#endif
		}
	}
	// Check if the calculation was successful
	for (int i = 0; i < M; i++) {
		for (int j = 0; j < M; j++) {
#ifndef EASYCOSIM
			ctrl_val.bitarr = cache_access(2 * M * M + i * M + j, 0, READ,
					mymem);
#else
			real_val.flt = c[i][j];
			ctrl_val.bitarr = cache_access(2 * M * M + i * M + j, 0, READ,
					mymem, real_val.bitarr);
#endif
			if (c[i][j] != ctrl_val.flt) {
				cout << "wrong answer in: " << i << " " << j
						<< " expected val: " << c[i][j] << " value we got: "
						<< ctrl_val.flt << endl;
			}
		}
	}
#endif
}
