def find_composites(N):

    composites = []
    dividend = 0
    count = 0

    while count <= N:

        dividend += 1

        for divisor in range(2,dividend + 1):
            if dividend % divisor == 0 and divisor != dividend:
                composites.append(dividend)
                count += 1
                break

    return composites

print(find_composites(100))
