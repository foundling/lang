#!/usr/bin/env python

import time 

def calc_squares(nums): 
    time.sleep(2)
    print([n*n for n in nums]);

def calc_cubes(nums):
    time.sleep(2)
    print([n*n*n for n in nums]);

arr = [1,2,3,4,5]

t_start = time.time()

calc_squares(arr)
calc_cubes(arr)

t_end = time.time()

print(t_end - t_start)
