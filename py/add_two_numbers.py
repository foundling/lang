class Solution(object):
    def addTwoNumbers(self, l1, l2):

        BASE = 10
        carry = 0
        val = 0
        root = node = ListNode(0)

        while l1 or l2 or carry:

            if l1:
                carry += l1.val
                l1 = l1.next

            if l2:
                carry += l2.val
                l2 = l2.next

            carry, val = divmod(carry, BASE)
            node.next = ListNode(val)
            node = node.next

        return root.next 
