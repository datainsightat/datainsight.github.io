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
  
  const strings = ['a','b','c','d'];
  //32Bit: 4 shelfs * 4 items = 16 bytes of storage
  
  strings[2] //index starts from 0
  => 'c'
  
  strings.push('e'); // O(1)
  
  console.log(strings);
  => ['a','b','c','d','e']
  
  strings.pop(); // O(1)
  
  console.log(strings);
  => ['a','b','c','d']
  
  

