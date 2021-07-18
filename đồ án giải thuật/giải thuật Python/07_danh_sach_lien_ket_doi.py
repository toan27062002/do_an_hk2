# -*- coding: utf-8 -*-
"""
Created on Sun Jul 18 08:20:43 2021

@author: Toan
"""

class Node: 
  
    # Hàm tạo để tạo một nút mới
    def __init__(self, data): 
        self.data = data 
        self.next = None
        self.prev = None
  
# Lớp tạo danh sách được liên kết kép 
class DoublyLinkedList: 
  
    # Khối mã lệnh cho Danh sách được Liên kết Đôi rỗng
    def __init__(self): 
        self.head = None
  
    # Đưa ra một tham chiếu đến đầu danh sách và một
    # số nguyên, chèn một nút mới vào đầu danh sách 
    def push(self, new_data): 
  
        # 1. Nút phân bổ 
        # 2. Đưa dữ liệu vào đó
        new_node = Node(new_data) 
  
        # 3. Thực hiện tiếp theo của nút mới làm đầu và
        # trước là Không có (đã Không có)
        new_node.next = self.head 
  
        # 4. thay đổi trước của nút đầu thành new_node
        if self.head is not None: 
            self.head.prev = new_node 
  
        # 5. di chuyển đầu để trỏ đến nút mới
        self.head = new_node 
  
    # Đã cho một nút là pres_node, hãy chèn một nút mới sau
    # nút đã cho
    def insertAfter(self, prev_node, new_data): 
  
        # 1. Kiểm tra xem prev_node đã cho là None 
        if prev_node is None: 
            print ("the given previous node cannot be NULL")
            return 
  
        # 2. phân bổ nút mới
        # 3. put in the data 
        new_node = Node(new_data) 
  
        # 4. Tạo mạng của nút mới như nút tiếp theo của nút trước
        new_node.next = prev_node.next
  
        # 5. Đặt pres_node như trước của new_node
        prev_node.next = new_node 
  
        # 6. Đặt trước đó là pre_node của new_node
        new_node.prev = prev_node 
  
        # 7. Thay đổi trước của nút tiếp theo của new_nodes
        if new_node.next is not None: 
            new_node.next.prev = new_node 
  
    # Đưa ra một tham chiếu đến phần đầu của DLL và số nguyên,
    # thêm một nút mới vào cuối
    def append(self, new_data): 
  
        # 1. Nút phân bổ
        # 2. Đưa vào dữ liệu
        new_node = Node(new_data) 
  
        # 3. Nút mới này sẽ là nút cuối cùng,
        #  vậy hãy làm cho nó tiếp theo là None 
        new_node.next = None
  
        # 4. Nếu Danh sách được Liên kết trống, thì hãy tạo
        # nút mới với tư cách là người đứng đầu
        if self.head is None: 
            new_node.prev = None
            self.head = new_node 
            return 
  
        # 5. Đi qua khác cho đến nút cuối cùng
        last = self.head 
        while(last.next is not None): 
            last = last.next
  
        # 6. Thay đổi nút tiếp theo của nút cuối cùng
        last.next = new_node 
  
        # 7. Đặt nút cuối cùng làm nút trước của nút mới
        new_node.prev = last 
  
        return
  
    # Hàm này in nội dung của danh sách liên kết
    # bắt đầu từ nút nhất định
    def printList(self, node): 
  
        print ("\nTraversal in forward direction")
        while(node is not None): 
            print (" % d" %(node.data), )
            last = node 
            node = node.next
  
        print ("\nTraversal in reverse direction")
        while(last is not None): 
            print (" % d" %(last.data), )
            last = last.prev
            
# Chương trình điều khiển để kiểm tra các chức năng trên
  
# Bắt đầu với danh sách trống
llist = DoublyLinkedList() 
  
# Insert 6. Vì vậy, danh sách trở thành 6->None 
llist.append(6) 
  
# Insert 7 lúc bắt đầu. 
# Vì vậy, danh sách liên kết trở thành 7->6->None 
llist.push(7) 
  
# Insert 1 lúc bắt đầu. 
# Vì vậy, danh sách liên kết trở thành 1->7->6->None 
llist.push(1) 
  
# Insert 4 cuối cùng. 
# Vì vậy, danh sách liên kết trở thành 1->7->6->4->None 
llist.append(4) 
  
# Insert 8,sau 7. 
# Vì vậy, danh sách liên kết trở thành 1->7->8->6->4->None 
llist.insertAfter(llist.head.next, 8) 
  
print ("Created DLL is: ", )
llist.printList(llist.head)