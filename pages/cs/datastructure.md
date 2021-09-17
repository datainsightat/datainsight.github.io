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
          this.data.length
        }
        return hash;
      }
      
      set() {
      }
      
      get() {
      }
    }
    
    const myHashTable = new HashTable(50);
    myHashTable.set('grapes',10000);
    myHashTable.get('grapes);
