---
date: "2015-11-05 09:10 -0500"
layout: post
desc: "A freeCodeCamp assignment to find the smallest common multiple that can be evenly divided by two numbers, along with all numbers in their sequence."
tags: webdev freecodecamp
published: true
title: "freecodecamp bonfire: smallest common multiple"
---

Oh man, this one was a doozy. Here's the assignment:

> Find the smallest common multiple of the provided parameters that can be evenly divided by both, as well as by all sequential numbers in the range between these parameters.

> The range will be an array of two numbers that will not necessarily be in numerical order.

> e.g. for 1 and 3 - find the smallest common multiple of both 1 and 3 that is evenly divisible by all numbers between 1 and 3.

Sounds easy, right? It pretty difficult for me to wrap my head around, but I actually got this one **almost** on my first try. See my solution below with explanations of each step in the comments.

{% highlight js %}
function smallestCommons(arr) {
  
  // Define two arrays to get the full sequence for both numbers in the array
  
  var sequence1 = [];
  var sequence2 = [];
  
  // I'm going to use this variable to tell this function to keep running the loop
  
  var num = false;
  
  // I'll use this variable as a counter to check each potential multiple
  
  var counter = 1;
  
  // These two for loops are building my two sequences
  
  for (var i = 1; i <= arr[0]; i++) {
    sequence1.push(i);
  }
  
  for (var j = 1; j <= arr[1]; j++) {
    sequence2.push(j);
  }
  
  // Here's the meat of the operation, running a while loop until the answer is found
 
  while (num === false) {
    
    // Check to see if the current number is a multiple of both starting values
    
    if (counter % arr[0] === 0 && counter % arr[1] === 0) {
      
      // Divide the current number by every number in both sequences,
      // checking to see if they're evenly divisible. If they are, all
      // the values in these two new arrays will be 0
      
      var check1 = sequence1.map(function(x) {
        return counter % x;
      });
      
      var check2 = sequence2.map(function(x) {
        return counter % x;
      });
      
      // Check to see if all values in both new arrays are 0. If they are,
      // set num = true to stop running the loop.
      
      if (check1.every(elem => elem === 0) && check2.every(elem => elem === 0)) {
        num = true;
      }
      
    }
    
    // Increase the current number only if loop is still set to run
    
    if (!num) {
      counter++;
    }
    
  }
  
  return counter;
}
{% endhighlight %}

Like the last few bonfires I've worked on, I get done this one, I look at the code and I think to myself: "There's got to be a simpler way to do this." I'm going to make it a habit to look for solutions other people have found after I finish eash bonfire, and I hope these posts serve that purpose for others too.
