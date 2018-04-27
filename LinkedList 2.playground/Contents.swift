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

   func reverse() -> LinkedListNode? {
      var previous: LinkedListNode?
      var current: LinkedListNode?
      var next: LinkedListNode?

      current = head
      tail = current

      while current != nil {
         next = current?.next
         // reverse the next pointer
         current?.next = previous
         previous = current
         current = next
      }
      head = previous
      return head
   }
}

let myLinkedList = LinkedList(array: [0,1,2,3,4])
print("Forward")
myLinkedList.print()
print("Reverse")
myLinkedList.reverse()
myLinkedList.print()
print("One Node List")
let oneNodeList = LinkedList(array: [0])
oneNodeList.reverse()
oneNodeList.print()



