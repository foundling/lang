def test_fn(i, o, fn):

    return 'Pass' if fn(i) == o else 'Fail'

def count_repeats(s):

    result = ''

    if not len(s):
        return result

    count = 1
    index = 0
    end = len(s)

    while index < end:



    return result

print(test_fn('aabbaabba','a2b2a2b2a1',count_repeats))
print(test_fn('','',count_repeats))
print(test_fn('a','a1',count_repeats))

print(count_repeats('aabb'))
