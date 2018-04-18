import UIKit

// Singly inked list

class LinkedListNode {
   var data: Int = 0
   var next: LinkedListNode?
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

      /*
       Edge cases:
       1. Empty LinkedList, no nodes -> return
       2. Removing the first node, i.e. head
       - No previous node, set next node as head
       3. Removing the last node, i.e. tail
       - no next node, set previous node as tail
       4. Removing the only node
       - no previous or next nodes, set head and tail to nil
       */

      // Edge case 1, Empty List
      if head == nil {return}

      var previous: LinkedListNode?
      var current: LinkedListNode?
      var next: LinkedListNode?
      current = head
      next = current?.next
      while current?.data != data {
         // Iterated through all nodes without a match, return
         if current?.next == nil {
            return
         }
         previous = current
         current = next
         next = current?.next
      }
      // Edge case 4, removing only node
      // Is this the only node?
      if previous == nil && next == nil {
         head = nil
         tail = nil

      // Edge case 2, removing 1st node
      // Are we removing the first node, head?
      } else if previous == nil {
         // Yes, we are removing the first node
         head = next

      // Edge case 3, removing the last node, tail
      // Is this the last node?
      } else if next == nil {
         // Yes, we are removing the last node
         previous?.next = nil
         tail = previous
      } else {
         // Removing a "middle node"
         previous?.next = next
      }
      // Remove references in node to be removed
      current?.next = nil
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
      var current: LinkedListNode?
      var next: LinkedListNode?
      current = head
      next = current?.next

      while current != nil {
         Swift.print(current!.data)
         current = next
         next = current?.next
      }
   }
}

let myLinkedList = LinkedList(array: [7,13,20,1,5,10])
//myLinkedList.print()
myLinkedList.count()
myLinkedList.indexOf(data: 7)
//myLinkedList.elementAt(index: 2)
myLinkedList.contains(data: 21)

let someLinkedList = LinkedList(array: [1,2,3,4,5])
// RemoveFirst: Edge case 2, remove 1st node
someLinkedList.removeFirst(data: 1)
// RemoveFirst: Edge case 3, remove last node node
someLinkedList.removeFirst(data: 5)
// RemoveFirst: Edge case 4, remove only node
someLinkedList.removeFirst(data: 2)
someLinkedList.removeFirst(data: 3)
someLinkedList.removeFirst(data: 4)
someLinkedList.print()






