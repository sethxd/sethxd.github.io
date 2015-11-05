---
date: "2015-10-30 14:27"
layout: post
title: "freecodecamp zipline: javascript calculator"
desc: Building a calculator with Javascript as part of the freecodecamp instructional course.
tags: webdev freecodecamp
published: true
---


So I started going through [freeCodeCamp's](www.freecodecamp.com) online courses a few months ago, but my progress has been pretty stop-n-go. I blazed through all the basic HTML & CSS courses, and all the beginner JavaScript & jQuery was all stuff I've seen before too. Once you make it through those, freeCodeCamp throws these projects they call 'ziplines' at you, which are much more involved, full assignments without specific instructions.

The ones I've done so far have been challenging, and I went through them more than a month ago before I started this blog. So, coming back to freeCodeCamp, I thought it would help me to document my work and spell out my thought process on here.

The latest assignment I've worked on required me to build a calculator with Javascript. You can see [how my final calculator turned out on codepen](http://codepen.io/sethxd/pen/YyLWdN).

##Design

The first thing I did was build the structure of a calculator with Bootstrap button styling.

{% highlight html linenos %}
<div class="row">
    <div class="col-xs-3 btn btn-default reset">AC</div>
    <div class="col-xs-3 btn btn-default reset">CE</div>
    <div class="col-xs-3 btn btn-default">%</div>
    <div class="col-xs-3 btn btn-default operator divide">/</div>
  </div>
  <div class="row">
    <div class="col-xs-3 btn btn-default number">7</div>
    <div class="col-xs-3 btn btn-default number">8</div>
    <div class="col-xs-3 btn btn-default number">9</div>
    <div class="col-xs-3 btn btn-default operator multiply">X</div>
  </div>
{% endhighlight %}

I used classes to handle what clicking each button would do. I gave the class `number` to numbers and `operator` to operators, along with specific classes for each operation like `multiply`, `subtract`, etc, and an `equals` class on the equals button.

I placed a little screen above all the buttons and ended up with something that looks like this:

![javascript calculator](\assets\javascript_calc.png)

##Function

The design was the easy part. Making it functional was another story.

I ended up piling pretty much everything into one click function, because all my buttons have the `btn` class:

`$('.btn').click(function() {}`

First, I wanted to set up the reset buttons to totally clear all numbers and operations, so I set up an if statement to run the `reset()` function if the button has the `reset` class:

{% highlight js linenos %}
var reset = function() {
  currentTotal = "0";
  number1 = 0;
  operator = "";
  $("#screen").html(currentTotal);
}
{% endhighlight %}

My second if statement determines if the button clicked was a number:

{% highlight js linenos %}
if ($(this).hasClass('number')) {
    if (currentTotal !== "0") {
      var temp = $(this).text();
      console.log(temp);
      currentTotal += temp;
      $("#screen").html(currentTotal);
    } else {
      var temp = $(this).text();
      console.log(temp);
      currentTotal = temp;
      $("#screen").html(currentTotal);
    }
{% endhighlight %}

If the button has the `number` class, I check to see if the current number displayed in the screen is 0. If it is, I replace 0 with the number clicked. This is to avoid having the number in the screen start with 0. If the current number in the screen **isn't** 0, the number clicked is just added to the end of the current one.

If the button wasn't a number, it's got to be an operator. So my next if statement determines, if it's an operator, which one it is:

{% highlight js linenos %}
else if ($(this).hasClass('operator')) {
    if ($(this).hasClass('divide')) {
      number1 = parseInt(currentTotal);
      $("#screen").html("0");
      currentTotal = "0";
      operator = "divide";
    }
    else if ($(this).hasClass('multiply')) {
      number1 = parseInt(currentTotal);
      $("#screen").html("0");
      currentTotal = "0";
      operator = "multiply";
    }
    else if ($(this).hasClass('add')) {
      number1 = parseInt(currentTotal);
      $("#screen").html("0");
      currentTotal = "0";
      operator = "add";
    }
    else if ($(this).hasClass('subtract')) {
      number1 = parseInt(currentTotal);
      $("#screen").html("0");
      currentTotal = "0";
      operator = "subtract";
    }
{% endhighlight %}

When a user clicks one of these operator buttons, a few things happen:

1. A global variable, `operator`, receives one of four values: `divide, multiply, add, or subtract`.
2. The `currentTotal` is transferred to another global variable, `number1`, and cleared.
3. The screen is reset to display 0.

After that, the user is free to input the second number of their operation. Once they do that, and press the equals button, **magic happens**.

{% highlight js linenos %}
else if ($(this).hasClass('equals')) {
      switch (operator) {
        case "divide":
          currentTotal = number1 / parseInt(currentTotal);
          $("#screen").html(currentTotal);
          break;
        case "multiply":
          currentTotal = number1 * parseInt(currentTotal);
          $("#screen").html(currentTotal);
          break;
        case "add":
          currentTotal = number1 + parseInt(currentTotal);
          $("#screen").html(currentTotal);
          break;
        case "subtract":
          currentTotal = number1 - parseInt(currentTotal);
          $("#screen").html(currentTotal);
          break;
        default:
          $("#screen").html("#ERROR");
          currentTotal = "0"
          break;
      }
    }
{% endhighlight %}

When the user hits the equals button, I bring in a JavaScript switch statement to look at the `operator` variable. If that variable is empty, meaning they didn't click one of the operator buttons yet, it throws up an error. But if they did click an operator, the function takes the original number stored in `number` and performs the correct operation on that, along with the current number displayed in the screen (`currentTotal`).

Ta-da! This calculator meets the requirements for the freeCodeCamp assignment, but there's a few other things I'd like to cleanup in the future.

For now, I'm going to move on to the next steps on the track so I don't lose momentum.
