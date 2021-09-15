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

|Index|Item|
|-|-|
|0|Juice|
|1|Apple|
|2|...|

* lookup O(1)
* push O(1)
* insert O(n)
* delete O(n)
<a/>
  
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

