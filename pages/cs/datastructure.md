# Introduction to Data Structures

Data Structures + Algorithms = Programs  
  
How to built a data structure?  
How to use a data structure?  
  
## How Computers Store Data

* RAM Random Access Memory (fast): Variables
* Storage (slow): Persistant data
* CPU
* Cache (Tiny RAM, very fast)
  
## Most Important Data Structures

* Arrays
* Stacks
* Queues
* Linked Lists
* Trees
* Tries
* Graphs
* Hash Tabley

## Data Operations

* Access
* Insertion
* Deletion
* Traversal
* Searching
* Sorting

# Arrays

|No Index|Item|
|-|-|
|0|Juice|
|1|Apple|
|2|...|

* lookup O(1)
* push O(1)
* insert O(n)
* delete O(n)
<a/>

## Examples

    const strings = ['a','b','c','d'];
    //32Bit: 4 shelfs * 4 items = 16 bytes of storage

    strings[2] //index starts from 0
    > 'c'

    strings.push('e'); // O(1)

    console.log(strings);
    > ['a','b','c','d','e']

    strings.pop(); // O(1)
    > ['a','b','c','d']
    
    strings.unshift('x');
    > ['x','a','b','c','d'] // O(n)
    
    strings.splice(2, 0, 'y');
    > ['c','a','y','b','c'] // O(n/2) > O(n)
    
## Types of Arrays

* Static (Fixed Size)
* Dynamic > append O(1) can be O(n)

## Implementing an Array

    class MyArray {
      constructor() {
        this.length = 0;
        this.data = {};
      }
      
      get(index) {
        return this.data[index];
      }
      
      push(item) {
        this.data[this.length] = item;
        this.length ++;
        return this.length;
      }
      
      pop() {
        const lastItem = this.data[this.length-1];
        delete this.data[this.length-2];
        this.length --;
        return LastItem;
      }
      
      delete(index) {
        const item = this.data[index];
        this.shiftItems(index);
      }
      
      shiftItems(index) {
        for (let i = index; i < this.length - 1; i++) {
          this.data[i] = this.data[i+1];
        }
        delete this.data[this.length-1];
        this.length --;
      }
    }
    
    const newArray = new MyArray();
    newArray.push('hi');
    newArray.index(0);
    mewArray.pop();

## Conclusion

|Pro|Con|
|-|-|
|Fast lookkups|Slow inserts|
|Fast Push/Pop|Slow deletes|
|Ordered|Fixes-size|

# Hash Tables

Dictionaries, Objects, Hashtables, Libraries ...  

    basket.grapes = 1000

|Key|Value|
|-|-|
|501|1|
|502|3|
|501|...|

* insert O(1)
* lookup O(1)
* delete O(1)
* search O(1)
<a/>

## Hash Function (md5 Hash)

Generates value of fixed length for each input. You cannot generate the input from the output. It generates always the same output, if the input is constant.
  
indepotent  
  
Values are put in specific position in memory, based on the value. We do not need to iterare the whole datastructure.

## Downside: Collision

Different keys can generate same memory address, because of limited memory space. This is called collision. This proplem is solved by another datastructures like linked lists. Collisions slow down hash tables.

![Hash Table](../img/hash_table.jpg)
  
## Examples

    let user = { // keys must be strings. Random insertion order
      age:54,
      name: 'Kyle',
      magic:'true',
      scream: function() {
        console.log('aaah!');
      }
    }
    
    user.age; // O(1)
    user.speall = 'abra kadabra'; // O(1)
    user.scream(); // O(1)
    
    const a = new Map() //Save any datatype as key. Maintain insertion order
    
    const b = new Sets() // Stores just keys, no values

## Implementing a Hash Table

    class HashTable {
      constructor(size){
        this.data = new Array(size); // ['grapes',10000]
      }
      
      _hash(key) { // _ means private function
        let hash = 0;
        for (let i = 0; i < key.length; i++) {
          hash = (hash + key.charCodeAt(i) * i) %
          this.data.length;
        }
        return hash;
      }
      
      set(key, value) {
        let address = this._hash(key);
        if (!this.data[adress]) {
          this.data[address] = [];
        }
        this.data[address].push(key,value]);
      }
      
      get(key) {
        let address = this._hash(key);
        const currentBucket = this.data[address];
        if (currentBucket) {
          for(let i = 0; i < currentBucket.length; i++) {
            if (currentBucket[i][0] === key) {
              return currentBucket[i][1];
            }
          }
        }
      }
      
      keys() {
        const keysArray = [];
        for (let i=0; i < this.data.length; i++) {
          if(this.data[i]) {
            keysArray.push(this.data[i][0][0]);
          }
        }
        return keysArrays;
      }
    }
    
    const myHashTable = new HashTable(50);
    myHashTable.set('grapes',10000);
    myHashTable.set('apples',50);
    myHashTable.set('oranges',1);
    myHashTable.get('grapes);
    myHashTable.keys();

## Comparison

|Method|Arrays|HashTables|
|-|-|-|
|search|O(n)|O(1)|
|lookup|O(1)|O(1)|
|push|O(1)||
|insert|O(1)|O(1)|
|delete|O(n)|O(1)|

## Examples

    //Given 2 arras, create a function that let's user know whether these two arrays contain any common items.
    
    fucntion containsCommonItem_slow(arr1,arr2) {
      for (let i=0; arr1.length; i++) {
      }
        for (let j=0; arr2.length; j++) {
          if(arr1[i] === arr2[j]) {
            return true;
          }
        }
      }
    } //O(n^2)
    
    function containsCommonItem_fast(arr1,arr2) {
      let map = {};
      for (let i=0; i < arr1.length; i++) {
        if(!map[array1[i]]) {
          const item = array1[i];
          map[item] = true;
        }
      }
      for (let j=0; j < arr2.length; j++) {
        if(map[array2[i]]) {
          return array2[j];
        }
      }
    } // O(n)

    //Given an array = [2,5,1,2,3,5,1,2,4]
    //Tell the first recurring Number (2)
    
    function fristRecurringCharacter_slow(input) {
      for (let i = 0; i < input.length; i++) {
        for (let j = i + 1; j < input.length; i++) {
          return input[i];
        }
      }
    } //O(n^2) //Solution: 2
    
    function firstRecurringCharacter_fast(input) {
      let map = {};
      for (let i = 0; i < input.length; i++) {
        if(map[input[i]] !== undefined) {
          return input[i];
        } else {
          map[input[i]] = i
        } 
      }
    } //O(n) //downside: higher memory requirement //Solution 5
    
    firstRecurringCharacter_fast([2,5,5,2,3,5,1,2,4])
    
## Conclusion

|Pro|Con|
|-|-|
|Fast lookups|Unordered|
|Fast Inserts|Slow Iteration|
|Flexible Keys||

# Linked Lists

* Singly Linked Lists
* Doubly Linked Lists
<a/>

![Linked List Singly](../img/linked_list_singly.jpg)

    const basket = ['apples','grapes','pears'];
    
## Comparison

|prepend|O(1)|
|append|O(1)|
|loopkup|O(n)|
|insert|O(n)|
|delete|O(n)|

## Pointer

    const obj1 = {a:true];
    const obj2 = obj1;
    
    obj1.a = false;
    
    => obj1 = false, ob2 = false
 
## Example Singly Linked List
 
    //1 --> 10 --> 5 --> 99 --> 16
    
    //let myLinkedList = {
    //  head: {
    //    value: 10
    //    next: {
    //      value: 5,
    //      next: {
    //        value: 16,
    //        next: null
    //      }
    //    }
    //  }
    //}
    
    class newNode {
      constuctor(value) {
        this.value = value;
        this.next = null;
      }
    }
    
    class LinkedList {
      constuctor(value) {
        this.head = new Node(value);
        this.tail = this.head;
        this.length = 1;
      }
      
      append(value){
        const newNode = new Node(value);
        this.tail.next = newNode;
        this.tail = newNode;
        this.length++;
        return this;
      }
      
      prepend(value){
        const newNode = new Node(value);
        newNode.next = this.head;
        this.head = newNode;
        this.length++;
        return this;
      }
      
      printList(){
        const array = [];
        let currentNode = this.head;
        while (currentNode !== null) {
          array.push(currentNode.value);
          currentNode = currentNode.next;
        }
      }
      
      insert(index, value) {
        //check params
        if (index >= this.length) {
          return this.append;
        }
        const newNode = new Node(value);
        currentNode = {};
        const leader = this.traverseToIndex(index-1);
        const holdingPointer = leader.next;
        leader.next = newNode;
        newNode.next = holdingPointer;
        this.length++;
        return this.printList();
      }
      
      traverseToIndex(index) {
        //check params
        let counter = 0;
        let currentNode = this.head;
        while (counter !== index {
          currentNode = currentNode.next;
          coutner++;
        }
        return currentNode;
      }
      
      remove(index) {
        //check params
        const leader = this.traverseToIndex(index-1);
        const unwantedNode = leader.next;
        leader.next = unwantedNode.next;
        this.length--;
        return this.printLIst();
      }
      
    }
    
    const myLinkedList = new LinkedList(10);
    myLinkedList.append(5);
    myLinkedList.append(16);
    myLinkedList.prepend(1);
    myLinkedList.insert(2,99);
    
## Doubly Linked Lists

![Linked List Doubly](../img/linked_list_doubly.jpg)

