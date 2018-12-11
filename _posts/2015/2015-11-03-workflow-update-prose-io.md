---
date: "2015-11-03 10:52 -0500"
layout: post
desc: Prose.io is a fantastic tool for updating Jekyll blogs hosted on Github Pages.
tags: webdev jekyll
published: true
title: "Workflow Update - Prose"
---



After finding a new tool, I'm testing a change to my blog posting workflow.

Since I started working with Jekyll, this has been my typical workflow:

1. Write my Markdown post in Atom.
2. Commit the new post to the blog's local git.
3. Sync with the Github Pages repository to make it live.

In practice this isn't too bad, and I enjoy working with Atom. But it's clunky, especially compared to one-click-posting services like Wordpress. Today I spent a little time searching for an alternative and found [Prose](http://prose.io/#about).

Prose syncs up with your Github account and offers an online Markdown editor for your posts, even offering advanced integration with [Jekyll](https://jekyllrb.com/). I'm writing this post in it as a trial run, see?

![prose_editor.png]({{site.baseurl}}/assets/prose_editor.png)

So far it's great. I like the integrated Markdown editing tools, and it even supports drag-and-drop for uploading images. It's very easy to get started, only requiring some additional lines to your `_config.yml` file. Here's what mine looks like:

{% highlight yaml linenos %}
# Prose configuration
prose:
  media: "assets"
  siteurl: "http://www.seth-dehaan.com"
  metadata:
    _posts:
      - name: "layout"
        field:
          element: "hidden"
          value: "post"
      - name: "title"
        field:
          label: "title"
          element: "text"
          value: "insert title here"
      - name: "description"
        field:
          label: "meta-description"
          element: "text"
          value: "meta-description"
      - name: "tags"
        field:
          label: "tags"
          element: "text"
          value: "tags"
      - name: "title"
        field:
          label: "title"
          element: "text"
          value: "insert title here"
{% endhighlight %}

Those lines do a few things:

- Define the folder for media uploads.
- Define the site's base url.
- Define metadata options for new posts.

There's even a live preview option to see how it will look on your site (thought it doesn't seem to work with code highlighting). My first impressions of Prose are almost entirely positive, and I know it'll be nice to be able to update this blog from anywhere.
