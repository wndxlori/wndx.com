---
layout: cta
title: The Landscape Has Changed
categories:
- software craft
tags:
- development
- business
- technology
newsletter:
  image:
  credit: <span class="text-small"> (Credit&colon; <a href="https://accordingtodevin.tumblr.com/">According to Devin</a>)</span>
---
This tweet really made me think about how much the landscape of getting applications built and scaled has changed during my career. Not just Amazon S3, but Amazon EC2 as well. Today we take having all that computing power at our fingertips for granted. But it wasn’t always this way.

Once upon a time 😉 when Amazon EC2 and S3 were still in the “doesn’t Amazon just sell shit?” stages (2007), I was working at a startup on a mapping project where I calculated we’d need to purchase a machine worth about $15K-$20K, and run it 24/7 for about six-to-eight weeks, in order to generate the complete set of Google Map tiles we needed. And then we’d need to run it again for a second smaller set (about four-to-six weeks). And then there was the storage and backup we needed to buy to hold all those images (probably gonna run us another $10K-$15K). So this project was projected at about 14 weeks and over $30K.

We just didn’t have that much spare cash on hand. I had been reading about EC2 and S3, so I hired a fellow freelancer I knew was looking for work to take on the project of figuring out how to parallelize the tile generation process to run on a bunch of EC2 servers and store all the tiles on S3.

My friend charged us about $2K for the feasibility project, and $6k for the implementation. Took him about three weeks for the work, and about a week to run the project on EC2/S3. The only reason it took a week to run was because we got throttled, and had to find the right people to talk to at Amazon to get un-throttled. Turned out, in 2007, if you wanted to throw a couple of terabytes into S3 in a couple of days, you needed to tell them first 🤷‍♀️.

The total Amazon charges for the six really beefy machines we spun up plus the inbound data push to S3 were ~$1900, plus about $20/month in ongoing S3 storage.

So instead of 14 weeks and $30K, we got our set of tiles created in four weeks for about $10K (and I hadn’t even included person time in that first estimate!!).

What’s the lesson here? Keep your eyes open, because you never know when a bit of knowledge you stumbled on is going to save your boss mega-bucks and make you look like a star ⭐️.