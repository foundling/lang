def test_fn(i, o, fn):

    return 'Pass' if fn(i) == o else 'Fail'

def count_repeats(s):

    result = ''

    if not len(s):
        return result

    count = 0
    prev = s[0]

    for index, cur in enumerate(s[1:]):
        count += 1
        if cur != prev:  
            result += '{}{}'.format(prev,count)
            prev = cur
            count = 0

    result += '{}{}'.format(prev,count + 1)

    return result

print(test_fn('aabbaabba','a2b2a2b2a1',count_repeats))
print(test_fn('','',count_repeats))
print(test_fn('a','a1',count_repeats))
