---
layout: post
title: 'Dialogflow review: is building complex bots possible?'
featured-img: 'https://cdn.zivost.com/blogs/dialogflow/dialogflow+(1).jpg'
image:
  path: 'https://cdn.zivost.com/blogs/app_ideas/kanban.jpg'
  height: 1200
  width: 628
mathjax: true
tags:
  - Dialogflow
  - Voice
  - Bots
author: harsh_nigam
---

# Introduction

We had worked for two large US-based pizza brands to provide them order management systems for years when one of us asked that if they can have a voice interface to order pizzas in addition to their existing mobile and web interfaces. Quite recently we had explored solutions like Amazon’s Lex, Rasa, Wit.AI and Google’s Dialogflow. So we took that as an opportunity to learn the new technology and subsequently laid out a plan to make a smart pizza-ordering voice bot.

We went through the long documentation of the various bot services in the market and found Dialogflow to be simple and easy to get started with.

&nbsp;

# The Good

## Straightforward

Getting started with Dialogflow was simple and straightforward, the documentation was clear and easy to follow with the terminology being described in simple language. We were able to build a basic functional bot within minutes which consisted of a couple of intents, training phrases and some witty responses.

Digging deep was simple as well. Topics like follow-up intents, contexts, webhooks, fulfillments and user entities weren’t too complex to understand.

&nbsp;

## Integrations

With new additions like Voximplant, Genesys Cloud and Signalwire the range of integrations Dialogflow provides, matches with no other.

Phone Gateway is the one that we got particularly interested in and we did our entire bot development & testing by calling the US number (free) on our Skype accounts.

Dialogflow would be a no brainer if you’re in the US and want to receive calls, no other provider has such an easy one-click integration.

&nbsp;

## Quality

With features like History, Analytics, Training and the newly introduced Validation, we were able to refine our pizza ordering bot to include nuances like toppings, sauces, crust options and sizes. Our bot now had the option to BYOP (Build your own Pizza) which we considered to be a great feat considering the current state of smart bots.

&nbsp;

# The Bad

## Flexibility

Building complex scenarios with Dialogflow can be challenging due to limited flexibility. If you don’t plan the flow in advance, changing stuff can be complicated. You might have to re-create entire flows if you went wrong midway. You just can’t cut-paste intents from one place to another.

While planning entire flows carefully in advance might turn out to a good thing for some but still, you can’t be 100% sure. You are bound to tweak a few things as you go ahead.

But this shouldn’t stop you from using Dialogflow as you can’t build beautifully complex things without putting in efforts.

&nbsp;

## Complex Scenarios

While this might be a tough task for most of the platforms out there, but we’re not doing any comparisons here so let me put it straight: Handling complex scenarios with Dialogflow is tough.

While designing the bot we assumed some of our scenarios would be implemented painlessly but it turned out we were wrong. We faced some serious roadblocks on how to implement some of our complex scenarios and it seemed almost impossible until we contacted Dialogflow support who then confirmed that it indeed was impossible. Tough Luck\!

But, we didn’t give up easily. After some sleepless nights and two weeks of brainstorming on a single topic, we were able to implement those (impossible) scenarios using Dialogflow. We did tell the support guys about our progress, but they didn’t seem interested (even when we were enterprise customers).

&nbsp;

## SDK Documentation

We used NodeJS for all our webhook coding and found some missing clarity in the documentation. We had to dig deep into documentations (yes, there are multiple.), Github readme’s and example codes to figure some things like extracting parameters out of contexts at certain places.

So, you just need to be mentally prepared to spend hours researching into topics before you are able to implement them.

&nbsp;

# Conclusion

While implementing complex scenarios can be a little tough with Dialogflow, but after putting in some serious efforts, planning out the scenarios in advance, and being a little careful with the interface design you will be able to build a smart bot for your requirements.

If you want to build a voice or text bot, or you are facing roadblocks in your current agent feel free to shoot us an email at [info@zivost.com](mailto:info@zivost.com).