---
layout: post
title: How I Automated My Jekyll Process (Or&#58 I Changed My Mind, I Do Want Plugins)
date: '2016-02-04 09:00'
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

This was my biggest pain point: I wanted to use plugins, but I absolutely didn't want to build, commit, and deploy manually every time I wrote a new blog post. I started googling and ran across a few people who had used rake to automate the process, eventually finding [this thoroughly helpful post with an example rakefile](http://ixti.net/software/2013/01/28/using-jekyll-plugins-on-github-pages.html). Rake is a build automation tool, and inside this rakefile are two different tasks: `generate` and `publish`.

{% highlight ruby linenos %}
require "rubygems"
require "tmpdir"

require "bundler/setup"
require "jekyll"


# Change your GitHub reponame
GITHUB_REPONAME = "sethxd/sethxd.github.io"


desc "Generate blog files"
task :generate do
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end


desc "Generate and publish blog to gh-pages"
task :publish => [:generate] do
  Dir.mktmpdir do |tmp|
    cp_r "_site/.", tmp

    pwd = Dir.pwd
    Dir.chdir tmp

    system "git init"
    system "git add ."
    message = "Site updated at #{Time.now.utc}"
    system "git commit -m #{message.inspect}"
    system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
    system "git push origin master --force"

    Dir.chdir pwd
  end
end
{% endhighlight %}

The `generate` task just builds the blog, and the `publish` task first runs `generate`, then pushes the generated site to the master branch of the repository. This method of automation requires two branches for the repository:

- `source` for all the Jekyll files and raw configuration
- `master` for the generated site

I actually had a lot of trouble getting this up and running, mostly due to my inexperience with git. But that blog post I linked above was very helpful, and the comment thread is full of the common problems and solutions you might run across.
