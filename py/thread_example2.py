#!/usr/bin/env python

import threading
import time 

def calc_squares(nums): 
    time.sleep(2)
    print([n*n for n in nums]);

def calc_cubes(nums):
    time.sleep(2)
    print([n*n*n for n in nums]);

arr = [1,2,3,4,5]

t_start = time.time()

t1 = threading.Thread(target=calc_squares,args=(arr,))
t2 = threading.Thread(target=calc_cubes,args=(arr,))
t1.start();
t2.start();

t_end = time.time()
print(t_end - t_start)
