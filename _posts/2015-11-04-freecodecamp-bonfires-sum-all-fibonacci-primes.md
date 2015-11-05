---
date: "2015-11-04 13:38 -0500"
layout: post
desc: Some of my solutions for freeCodeCamp JavaScript algorithm bonfires explained.
tags: webdev freecodecamp
published: true
title: "freecodecamp bonfires: sum all fibonacci & primes"
---

To help myself work through these algorithm solutions in my head (and provide some assistance for anyone else working on them) I'm going to record and describe some of the code here, starting with...

##Sum all Odd Fibonacci Numbers

{% highlight js linenos %}
function sumFibs(num) {
  // First define the three key variables
  var prevNumber = 0;
  var currNumber = 1;
  var fibTotal = 0;
  
  while (currNumber <= num) {
  	// Check if the current Fibonacci number is odd, and add it to the total if it is.
    if (currNumber % 2 !== 0) {
      fibTotal += currNumber;
    }
    
    // Determine the next Fibonacci number by adding the previous and current
    var nextNumber = prevNumber + currNumber;
    // Update the previous number to the current value
    prevNumber = currNumber;
    // Set the current number to the next Fibonacci in the sequence
    currNumber = nextNumber;
  }
 
 // Finally, return the total
 return fibTotal;
}
{% endhighlight %}

I had some trouble with this one and wasted a lot of time trying to make a `for` loop work, messing with the value of an `i` variable I didn't need. I think one of the biggest points to remember with this one is to determine the value of the next Fibonacci number in the sequence before changing the previous and current values.

##Sum All Primes

{% highlight js linenos %}
function sumPrimes(num) {
  // Declare an array to place all the primes in, and a variable for the total
  var primes = [];
  var total;
  
  // Running a for loop starting at 2, since we know 1 and 0 aren't primes
  for (var i = 2; i <= num; i++) {
    
    // Initially assume i is a prime
    var isPrime = true;
    
    // Determine if i is actually a prime by dividing it by every number from 2 to i.
    for (var j = 2; j < i; j++) {
      
      // If it divisible by any other number with no remainder, it's not a prime
      if (i % j === 0) {
        isPrime = false;
      }
      
    }
    
    // If we determined i was a prime, push it to the array
    if (isPrime) {
        primes.push(i);
      }
    
  }
  
  // Add up all the values in the array and return the total
  total = primes.reduce(function(a,b) {
    return a + b;
  });
  
  return total;

}
{% endhighlight %}

This one was easier, but I think I did it in a convoluted way. Does anyone have an example of a different way they did it?
