import UIKit

// Singly inked list

class LinkedListNode: Equatable {
   var data: Int = 0
   var next: LinkedListNode?

   static func == (lhs: LinkedListNode, rhs: LinkedListNode) -> Bool {
      return
         lhs.data == rhs.data &&
         lhs.next == rhs.next
   }
}

class LinkedList {
   var head: LinkedListNode?
   var tail: LinkedListNode?

   init(array: [Int]) {
      // Build a Linked list with the values from the array
      var nextNode: LinkedListNode?
      for data in array {
         let newNode = LinkedListNode()
         newNode.data = data
         if head == nil {
            head = newNode
            tail = head
         } else if head?.next == nil {
            nextNode = newNode
            head?.next = nextNode
            tail = nextNode
         } else {
            nextNode?.next = newNode
            tail = newNode
            nextNode = tail
         }
      }
   }

   func append(data: Int) {
      let newNode = LinkedListNode()
      if head == nil {
         head = newNode
         tail = newNode
      } else {
         tail?.next = newNode
         tail = newNode
      }
   }

   func removeFirst(data: Int) {

   }

   func contains(data: Int) -> Bool {
      if head == nil {
         return false
      } else {
         var current: LinkedListNode?
         var next: LinkedListNode?
         current = head
         next = current?.next
         // While there is no match
         while current?.data != data {
            if next == nil {
               return false
            } else {
               // Move to next node
               current = next
               next = current?.next
            }
         }
         return true
      }
   }

   func elementAt(index: Int) -> LinkedListNode? {
      if head == nil {
         return nil
      }
      var current: LinkedListNode?
      var next: LinkedListNode?

      for i in 0...index {
         if i == 0 {
            current = head
            next = current?.next
         } else {
            current = next
            next = current?.next
         }
         // If index out of range, return nil
         if current == nil {
            return nil
         }
      }
      Swift.print("Returning Node at index \(index) with data, \(current!.data)")
      return current
   }

   func indexOf(data: Int) -> Int? {
      if head == nil {
         return nil
      } else {
         var current: LinkedListNode?
         var next: LinkedListNode?
         current = head
         next = current?.next

         var index = 0
         // Loop while current node's data does not match the input data...
         while current?.data != data {
            // Check if last node
            if next == nil {
               return nil
            }
            // Increment index
            index += 1
            current = next
            next = current?.next
         }
         return index
      }
   }

   func count() -> Int {
      var count = 0
      if head == nil {
         return count
      } else {
         count += 1
         var current: LinkedListNode?
         var next: LinkedListNode?
         current = head
         next = current?.next

         while next != nil {
            count += 1
            current = next
            next = current?.next
         }
         return count
      }
   }

   func print() {
      var text = "["
      if head != nil {
         var current: LinkedListNode?
         current = head

         while current?.next != nil {
            text += current!.data.description + ","
            current = current?.next
         }
         text += current!.data.description
      }
      text += "]"
      Swift.print(text)
   }

   func isCycle() -> Bool {

      if head == nil {
         return false
      }

      var fast: LinkedListNode?
      var slow: LinkedListNode?

      slow = head
      fast = head

      // If either become nil, no loop
      while slow?.next != nil && fast?.next?.next != nil {
         // Advance slow by 1 node
         slow = slow?.next
         // Advance fast by 2 nodes
         fast = fast?.next?.next

         if slow === fast {
            return true
         }
      }
      return false
   }

   func createCycleTailToHead() {
      tail?.next = head
   }

   func breakCycle() {
      tail?.next = nil
   }

   func isPalindrome() -> Bool {
      var isPalindrome = true
      if head == nil {
         isPalindrome = false
         return isPalindrome
      }
      // previous and next placeholders are used during reversing
      var previous: LinkedListNode?
      var next: LinkedListNode?
      // runner is used to determine middle of linked list
      // based on where forwardWalker is at the time it reaches the end
      var runner: LinkedListNode?
      // Used to move up the original linked list
      var forwardWalker: LinkedListNode?

      runner = head
      forwardWalker = head

      // While the runner is on a node, excluding the last node
      while runner != nil && runner?.next != nil {
         // Advance the ruuner 2 nodes
         runner = runner?.next?.next
         // Advance the walker 1 node
         // while reversing the list
         next = forwardWalker?.next
         forwardWalker?.next = previous
         previous = forwardWalker
         forwardWalker = next
      }

      // At this point, the forwardWalker will be on the exact middle node if odd amount of nodes
      // Or on the midle most node on the far side if even amount of nodes
      // If the runner landed on the last node (!= nil) then we have odd amount of nodes
      if runner != nil {
         // forwardWalker in exact middle of odd, advance 1 node since nothing to compare
         // middle node with in an odd numbered palindrome
         forwardWalker = forwardWalker?.next
      }
      // Used to move up the reversed half of the list
      var reverseWalker: LinkedListNode? = previous
      previous = next

      // Walk the forwardWalker up the last half of the list
      // Walk the reverseWalker up the reversed half of the list
      while forwardWalker != nil {
         // Check for equality in the nodes panindromic counterparts
         if reverseWalker?.data != forwardWalker?.data {
            isPalindrome = false
         }
         // Advance the reverseWalker up the reversed half while reversing the reversed half back to normal
         next = reverseWalker?.next
         reverseWalker?.next = previous
         previous = reverseWalker
         reverseWalker = next

         // Advance forwardWalker up last half of list
         forwardWalker = forwardWalker?.next
      }
      // We walked both sides matching all the way, this is a palindrome
      return isPalindrome
   }
}

// Test with multiple nodes
let myLinkedList = LinkedList(array: [7,13,20,1,5,10])
myLinkedList.isCycle()
myLinkedList.createCycleTailToHead()
myLinkedList.isCycle()
myLinkedList.breakCycle()
myLinkedList.isCycle()

// Test with single nodes
let singleNodeList = LinkedList(array: [0])
singleNodeList.isCycle()
singleNodeList.createCycleTailToHead()
singleNodeList.isCycle()

// Confirm reference vs equality
let node1 = LinkedListNode()
node1.data = 1
let node2 = LinkedListNode()
node2.data = 1
// Node 1 and Node 2 are equatable because they contain the same value and next pointer (next pointer, in this case, nil)
node1 == node2
// Node 1 and 2 do not share the same reference
node1 === node2



