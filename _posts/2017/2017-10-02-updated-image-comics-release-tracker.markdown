---
layout: "post"
title: "Updated Image Comics Release Tracker"
date: "2017-10-02 14:05"
desc: "I built an Image comics release tracker last year, recently made some updates."
tags: "webdev"
---

Last year I built a release tracker for Image comics. Last week I noticed it was busted, and in the process of fixing it I decided to make some upgrades.

## The Problem

I broke it with a pretty basic mistake. I set up the date picker wrong so it was only looking at the first digit for the month, which was fine January - September, but as soon as we hit October it got borked. That was a pretty easy fix.

When I got back into it, I remember I had originally wanted to add some kind of filtering, so instead of just looking at a wall of comic covers users could highlight their favorite writers. Over the course of a few hours I figured out how to do this, but it does feel a little janky. I'm positive there's a much easier way to do this, but that optimization is somewhere down the road.

## Adding Filtering by Author

To start, I just had to pull a list of all the writers for the selected week. This is already part of the data I'm pulling, so it was easy to throw them in an array.

There were two things I needed to do with this array:

- Remove duplicates (some writers might have multiple books in a given week)
- Alphabetize by last name

I found a handy shortcut for removing duplicates:

{% highlight js linenos %}

writerList = writerList.filter( (el, i, arr) => arr.indexOf(el) === i);

{% endhighlight %}

And this function works to look at the last name of each writer and sort by that:

{% highlight js linenos %}

function writerSort(a,b) {
  var splitA = a.split(" ");
  var splitB = b.split(" ");
  var lastA = splitA[splitA.length - 1];
  var lastB = splitB[splitB.length - 1];

  if (lastA < lastB) return -1;
  if (lastA > lastB) return 1;
  return 0;
}

{% endhighlight %}

Great, so now our list of authors is sorted and all duplicates are removed.

To get this list on the page, I looped through the array, spitting each name out as a list item with their last name as a data attribute:

{% highlight js linenos %}

writerList.forEach(function(x) {
        let name = x.split(" ");
        writerhtml += '<li class="wlink" data-name="' + name[name.length-1] + '">' + x + '</li>';
      });

{% endhighlight %}  

I also went back through the main loop and added the author's last name as a class to each comic's div.

With the correct classes and corresponding data attributes in place, this function does all the filtering:

{% highlight js linenos %}

$(document).ready(function() {
        $(".wlink").click(function() {
          if ($(this).hasClass("active")) {
            $('.faded').removeClass("faded");
            $(this).removeClass("active");
          } else {
            $('.faded').removeClass("faded");
            $('.active').removeClass("active");
            let filter = $(this).attr("data-name");
            let fullFilter = ".flex-item:not(." + filter + ")";
            $(fullFilter).addClass("faded");
            $(this).addClass("active");
          }
        })
      })

{% endhighlight %}

This function does the following things if the user clicks an author's name that is not currently active:

- Reset filtering for all items
- Reset active status
- Create a variable to target all items that do not have the selected writer's class
- Add the **faded** class to those items
- Add the **active** class to the clicked link

If the user clicks a writer's name that is already active:

- Remove the **faded** class from all items.
- Remove the **active** class from the clicked link.

It's not the cleanest way to do it, but it works! I've been testing it out myself, and it feels much quicker to parse the data and find the comics I'm really interested in. [Click here to try it out for yourself.](http://www.seth-dehaan.com/image-release-tracker)

## Further Improvements

After making these changes, I find myself thinking about other ways I could improve this tool. Additional filtering options, like by artist? Generate a printer-friendly list of all title and relevant info? Buttons to quickly move to the next or previous weeks.

If you get some use out of this tool, or have any suggestions for improvements, leave a comment and let me know!
