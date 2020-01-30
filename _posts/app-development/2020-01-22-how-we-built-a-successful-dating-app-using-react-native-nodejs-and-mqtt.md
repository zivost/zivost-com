---
layout: post
title: 'How we built a successful dating app using React Native, NodeJS and MQTT?'
featured-img: >-
  https://zivost-host.s3.amazonaws.com/blog_images/person-holding-space-gray-iphone-x-1440722-min.jpg
mathjax: true
---

We had a simple mindset: Offer a smooth and premium user experience which reflects on the idea behind the app being privacy-focused and judgement-free.

The challenge seemed small when we started but turned out we had a high expectation of the project and the usual technologies were too sluggish, out-dated or took a lot of implementation hours.

So, we choose a stack which will promise our customers a wonderful experience which remains our top priority even to this day.

## **Competitive Analysis (Tech):**

We’ve been researching a lot of dating apps and noticed several technical problems that shouldn’t be in our app:

1. With cross-platform apps, one platform (iOS usually) lagged in terms of regular updates. One platform was always performing better with fewer bugs and offered greater experience.
2. Almost all the dating apps have a slow chat as compared to Social Media apps.
3. Except for a few top ones, many apps offered a sluggish experience in terms of UX and UI and had an inconsistent design language.

## **The key challenges:**

1. Offer a seamless and similar experience on both platforms (iOS and Android)
2. Keep app size small (targeting developing nations)
3. Easy to implement localisation
4. Minimise server response time
5. Keep security and privacy as a high priority
6. Implement a flexible super-fast chat

&nbsp;

All the points factored in choosing the perfect tech stack.

&nbsp;

## **The Tech Stack:**

### **React Native:**

Choosing a robust framework with native-like performance wasn’t a tough decision with only two viable options Flutter and React Native.&nbsp;

Our team had prior experience in working with ReactJS and considering the tremendous community support we went for React Native.

React Native solved 3 of our key challenges:

1. Offer a seamless and similar experience on both platforms (iOS and Android)

React Native offers a fast experience with appreciable performance.&nbsp;

It is a cross-platform framework and big giants are using it (Facebook, Instagram, Uber, Airbnb, etc.)

&nbsp; 2. Keep app size small (targeting developing nations)

We ended up with a ~20MB APK, sweet\!

&nbsp; 3. Easy to implement localisation

“react-native-localize” made the process a cakewalk.

### **NodeJS:**

With years of experience in NodeJS, the choice seemed an easy one.

1. We were already using JavaScript in the apps
2. It’s fast (thanks to the v8 engine developed by Google)
3. Excellent real-time support (more on this in the MQTT section)

NodeJS along with some secret security implementations of our own (we don’t want to go in detail, obviously\!) we solved challenges 4 & 5.

### **Microservices:**

We divided our back-end code into parts to enhance the scalability and reduce server costs at the same time.

The services looked like:

1. Users Service
2. Matching Service
3. Chat Service

The three of them are communicating with each other using an open-source Microservices RPC framework we developed in-house called Teade ([https://github.com/zivost/teade](https://github.com/zivost/teade){: target="_blank"}).

### **MQTT:**

With MQTT being lightweight & fast, having a pub/sub mechanism and offering high reliability why should it be restricted to just IoT devices.

We wanted a solution that didn’t drain our user’s battery (like almost all the chat apps do) and was fast.

With MQTT we could build a custom and flexible real-time chat implementation that brought down the delivery of messages from a few seconds to a few hundreds of milliseconds. Also, the chat was running on TLS instead of TCP so our goal of security was hindered here.

A big shout out to the creator of Aedes ([https://github.com/moscajs/aedes](https://github.com/moscajs/aedes){: target="_blank"}) who made this possible on NodeJS, upon which we built our custom chat framework.

## **The process:**

Having blessed with a hard-working team, the big challenges seemed small in front of their confidence and spirits.

The team worked in weekly sprints using an agile methodology. We would hold weekly meetings to discuss the features, challenges, progress and future.

The process to release v1.0 took nearly 3 months.

## **The result:**

1. Successful implementation of the tech stack in building the application.
2. Displaying 60 fps, offering a seamless native-like experience.
3. Almost no hiccups, screen flickers, lags and crashes.

And here’s the link you(us too) have been waiting for all the while:

**[https://pleb.dating](https://pleb.dating){: target="_blank"}**