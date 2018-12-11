---
layout: post
title: "freeCodeCamp: Caesar's Cipher"
date: '2016-01-21 15:58'
desc: "How to build a ROT13 cipher translator with javascript"
tags: webdev freecodecamp
published: true
---

My next freeCodeCamp challenge involves building a Javascript for the [ROT13 cipher](https://en.wikipedia.org/wiki/ROT13). With the ROT13 cipher, a letter is replaced by the one 13 spaces away from it in the alphabet.

Here's a visual breakdown of how it works:

![ROT13 diagram](https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/ROT13_table_with_example.svg/320px-ROT13_table_with_example.svg.png){: .center-image}

So what's the best way to do this? Well, you could brute force it by running a collection of IF statements on each character: `if (str.charAt(i) == "A")...` But that would require like, 26 different IF statements. No thanks!

Thankfully, each of the letters in the alphabet has an [ASCII character code](http://www.asciitable.com/). Capitalized and uncapitalized letters actually have different codes, but for this challenge we're only dealing with capital letters, starting with A (65) and running through Z (90). To illustrate, I added character codes to a ROT13 table:

| 65 | 66 | 67 | 68 | 69 | 70 | 71 | 72 | 73 | 74 | 75 | 76 | 77 |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| A  | B  | C  | D  | E  | F  | G  | H  | I  | J  | K  | L  | M  |
| N  | O  | P  | Q  | R  | S  | T  | U  | V  | W  | X  | Y  | Z  |
| 78 | 79 | 80 | 81 | 82 | 83 | 84 | 85 | 86 | 87 | 88 | 89 | 90 |

So let's say the character I'm trying to decipher is A, with a code of 65. I would add 13 to it and get a code of 78, which is N. Easy, right? Just add 13 to the code for each character.

Except let's say you have P, with a character code of 80. Add 13 to that and you have 93, which is a `]` apparently. Hmmm. So if you're looking at any of the characters from the first half of the alphabet, you have to add 13 to their code. If they're from the second half of the alphabet, you have to subtract 13

Okay, I think we're ready to put this thing together! First things first, we're going to create a new array to put our translated characters into:

{% highlight js linenos %}
function rot13(str) {
  var newString = [];
{% endhighlight %}

To decipher messages, we're going to look at each character in a message using a `for` loop, like this: `for (var i = 0; i < str.length; i++)`. For our `if, else` options, each character will fall into one of three categories:

1. A non-alphanumeric character (spaces, punctuation)
2. A capital letter A - M
3. A capital letter N - Z

First, we'll determine if the character is not alphanumeric. If it is, we'll leave it as is in the coded message. So if it's a space, it'll stay a space. If it's an exclamation point, it'll stay an exclamation point.

We know the only codes we're really interested in are those for capital letters, so from 65 - 90. That means any character with code less than 65, or greater than 90, we can safely ignore. This first `if` statement accomplishes that:

{% highlight js linenos %}
if (str.charCodeAt(i) < 65 || str.charCodeAt(i) > 90) {
      newString.push(str.charAt(i));
    }
{% endhighlight %}

For our next `if` statement, we'll identify all characters from the second half of the alphabet, so anything with a code greater than 77. When we find one of these letters, we'll subtract 13 from the character code, identify the letter for this new code, and push it to our array:

{% highlight js linenos %}
else if (str.charCodeAt(i) > 77) {
      newString.push(String.fromCharCode(str.charCodeAt(i) - 13));
    }
{% endhighlight %}

For our final `else` statement, we know the only options left will be characters with a code from 65 - 77, so letters from the first half of the alphabet. For these we'll do the same thing as the last step, but adding 13 to the character code instead:

{% highlight js linenos %}
else {
      newString.push(String.fromCharCode(str.charCodeAt(i) + 13));
    }
{% endhighlight %}

With all the translated characters from the original message pushed to our new array, all we have to do is join them and return the result: `return newString.join("")`. Here's what the final, completed function looks like:

{% highlight js linenos %}
function rot13(str) {
  var newString = [];

  for (var i = 0; i < str.length; i++) {
    if (str.charCodeAt(i) < 65 || str.charCodeAt(i) > 90) {
      newString.push(str.charAt(i));
    } else if (str.charCodeAt(i) > 77) {
      newString.push(String.fromCharCode(str.charCodeAt(i) - 13));
    } else {
      newString.push(String.fromCharCode(str.charCodeAt(i) + 13));
    }
  }
  return newString.join("");
}
{% endhighlight %}

This was fun to build, and got me thinking about what other ciphers could be translated using functions. It's kind of like having a digital decoder ring.
