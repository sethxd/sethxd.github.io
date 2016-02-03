---
layout: post
title: automating my jekyll process
date: '2016-02-03 14:48'
desc: 'After much trial and error, this is how I switched over to building Jekyll locally and automatically deploying.'
tags: webdev jekyll
---

It's a new year, and time for change. When I first built this blog using Jekyll a few months ago, I figured I would host it on Github Pages because 1) it was free and 2) I didn't think I would ever need plugins. Well, things change.

The reason I decided to finally make this leap is silly. Let me take you through my process:

- I'm recording more footage while playing games.
- I want to share more of this footage in bite-size GIFs.
- I start to explore other, better options like gfycat.
- I run across a [blog post describing how to add a gfycat plugin to Jekyll](https://www.ishani.org/2015/01/15/gfycat-in-jekyll/).

And here we are with a newly automated blogging process, all because I wanted to easily do things like this:

{% gfycat LivelySmoothAmericanbobtail %}

That is an embedded gfycat generated with one little liquid tag:

`{% raw %}{% gfycat LivelySmoothAmericanbobtail %}{% endraw %}`.

I don't know why this was the thing to convert me to plugins. It's actually the first one I've integrated too, I haven't even figured out which other plugins I want to use yet.

This was my biggest pain point: I wanted to use plugins, but I absolutely didn't want to build, commit, and deploy manually every time I wrote a new blog post. I started googling and ran across a few people who had used rake to automate the process, eventually finding [this thoroughly helpful post with an example rakefile](http://ixti.net/software/2013/01/28/using-jekyll-plugins-on-github-pages.html).
