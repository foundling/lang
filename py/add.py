'''
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
'''

# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution(object):
    def addTwoNumbers(self, l1, l2):
        
        total = 0
        multiplier = 1
        
        # process values from linked lists until both are done
        while l1 or l2:
            
            l1val = l1.val if l1 else 0
            l2val = l2.val if l2 else 0
            
            total += (l1val * multiplier) + (l2val * multiplier)
            multiplier *= 10
            
            if l1 is not None: l1 = l1.next
            if l2 is not None: l2 = l2.next

        # we have sum of two digit lists as a single int
        # time to turn it back into digits

        list_head, node_pointer = None, None

        divisor = 1
        while divisor <= total:
            divisor *= 10
        divisor /= 10

        if divisor == 0:
            return ListNode(0)

        while divisor > 0:

            node = ListNode(total / divisor)
            total = total % divisor
            divisor /= 10

            if node_pointer is None:
                list_head = node
                node_pointer = node
            else:
                node.next = node_pointer
                node_pointer = node
                list_head = node
            
        return list_head


list3 = ListNode(9)
list4 = ListNode(9)

result = Solution().addTwoNumbers(list3, list4)

ptr = result
print 'answer: '
while ptr:
    print ptr.val
    ptr = ptr.next
