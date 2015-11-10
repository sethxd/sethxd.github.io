---
date: "2015-11-10 09:21 -0500"
layout: post
desc: "How I put together a comprehensive table of crafting recipes for Divinity Original Sin: Enhanced Edition."
tags: games divinity webdev
published: false
title: divinity original sin crafting table
---

The Enhanced Edition of [Divinity: Original Sin](http://www.divinityoriginalsin.com/) released on PS4 a few weeks ago, and I've been having a blast with it. You can do almost anything with very few restrictions:

- Try to pickpocket everyone
- Move objects around in the world
- Cast spells and create a ton of different environmental effects
- Build your characters any way you want
- Break down doors instead of unlocking them

I'd highly recommend it, but there's definitely a learning curve. Probably the least-explained system in the game is crafting. Basically, you can pull open the crafting interface and try to combine any two items. If you do something right, you'll usually unlock a recipe so you can repeat it easily the next time.

There are very few instructions for crafting in the game. Sometimes you'll find a book that unlocks a recipe or has specific instructions in it, but most of the time you're working with trial-and-error.

As part of my efforts to penetrate the intricate web of crafting recipes, I consulted a [crafting table I found on the wiki](http://divinity.wikia.com/wiki/Crafting_(DOS_EE)). It had a lot of information, but it wasn't sortable, needed to be cleaned up and optimized.

[So I built my own crafting table.](http://www.seth-dehaan.com/divinity_crafting/)

![div_craft_filter.gif]({{site.baseurl}}/assets/div_craft_filter.gif)

I used two main tools:

- [**Jets.js**](https://nexts.github.io/Jets.js/). This filters through all the results in the table superfast, it's ridiculous.
- [**bootstrap-table**](http://bootstrap-table.wenzhixin.net.cn/). Bootstrap-table adds easy formatting, sorting on all columns, and additional filtering options.

The table itself was pretty easy to get up-and-running thanks to those two utilities, but the task of cleaning up data is more time-consuming. I'm still working on verifying the accuracy of all the recipes and consolidating everything to cut down on the noise. But it's a fun project, I'm using it myself, and I've gotten some great feedback from the community on reddit too.

