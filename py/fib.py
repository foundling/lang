def fib(n):
    ''' return the nth fibonacci number '''

    i = 1
    a,b = 1,1

    while i < n:
        a,b = b,a+b
        i += 1

    return a

print(fib(5))
