my_list     = [3, 4, 6, 10, 11, 15]
alices_list = [1, 5, 8, 12, 14, 19]

def merge(a,b):

    merged = []

    i, j = 0, 0
    max_i = len(a)
    max_j = len(b)

    while i < max_i and j < max_j:

        if a[i] <= b[j]:
            merged.append(a[i])
            i += 1 

        else:
            merged.append(b[j])
            j += 1 


    if i >= max_i:
        merged.extend(b[j:])

    elif j >= max_j:
        merged.extend(a[i:])

    return merged


print merge(my_list, alices_list)
print merge([1], [])
print merge([], [1,2,5])
