---
layout: post
title: Avoid these mistakes while building a React Native app.
featured-img: >-
  https://zivost-host.s3.amazonaws.com/blog_images/person-holding-space-gray-iphone-x-1440722-min.jpg
mathjax: true
---

While starting a new mobile app project, choosing the right development stack often comes as a challenge. When covering a large part of your target audience is a priority, a platform that supports all the platforms takes the lead and that is React Native.

Considering the high-quality apps that were built in React Native (Facebook, Instagram & Airbnb to name a few), the outstanding community support and a simple learning curve, React Native has gained popularity among mobile app developers.

As with most of the awesome things in this universe, React Native development also comes with some challenges.

I write this article to help you avoid certain challenges which we have already been through and wasted several hours and cups of coffee over it. Let’s jump to the problems straight away with little small talk.

1. A missing key attribute in Flat List item.

If you don't specify a unique key to your FlatList item, react will re-render every time whenever an item is modified in the list. This will lead to poor performance on your app and results in bad user experience.

Providing every list item with a unique key will enable a stable identity which avoids re-rendering.

\`

&lt;FlatList&nbsp;

&nbsp;data=\{ \[1,2,3,4\] \}

&nbsp; &nbsp; keyExtractor=\{(item, index) =&gt; item.key\}

&nbsp; &nbsp; renderItem=\{(\{item\}) =&gt;

&nbsp; &nbsp; &nbsp; &nbsp; &lt;Text&gt;\{item\}&lt;/Text&gt;

&nbsp; &nbsp; \}

/&gt;

\`

The above code has an attribute&nbsp;**keyExtractor&nbsp;**which saves your app from the performance issues due to re-rendering. Be sure not to miss that one out.

&nbsp;

1. Leaving&nbsp;**console.log()**&nbsp;statements in the production app.

Console.log() statements are a blessing when it comes to debugging the app. It lets you point out exactly which line in your code is not working as expected.

&nbsp;

But, leaving&nbsp;**console.log()**&nbsp;statements in your production code will negatively affect your app performance. Eventually, your app will be slowed down due to bottlenecks in JavaScript threads.

&nbsp;

1. Binding functions inside the render method to pass params

What if I bind functions inside the render method?

&nbsp;

While rendering, it will create new methods instead of re-using the old ones\!

&nbsp;

\`

render()\{

return(

&lt;TouchableOpacity onPress=\{this.callme.bind(this)\}&gt;

&lt;Text&gt;Press Me&lt;/Text&gt;

&lt;/TouchableOpacity&gt;

)

\}

\`

In here, I iterate the TouchableOpacity button inside the map function.This breaks the performance optimization of the app because it creates different callbacks while rendering.You can solve this issue with binding callme() method either in the constructor or you can use property initializer syntax.

&nbsp;

\`

callme = () =&gt; \{

console.log("Pressed");

\}

render()\{

return(

&lt;TouchableOpacity onPress=\{this.callme\}&gt;

&lt;Text&gt;Press Me&lt;/Text&gt;

&lt;/TouchableOpacity&gt;

)

\}

\`

&nbsp;

&nbsp;

1. Don’t set state inside render block always use function to do this.

&nbsp;

1. Layouts for android and iOS. (eg: Ebytes Article screen)

&nbsp;

1. Not optimise images use in app very common.

&nbsp;

1. Use proper Project Structure. (Aayush ko b diktat ho rhi thi Aayush wale project me.)

&nbsp;

1. Never made components for common stuff.

&nbsp;

&nbsp;

Conclusion:

&nbsp;

While this may not be an exhaustive list (we don’t even intend it to be), we will try to add more problems/mistakes as we encounter them. You can write to us at info@zivost.com if you find something important that might benefit others while React Native development. Our mission is to save time and efforts of developers like us and delivering high-quality products to our users.

&nbsp;

If you want to build a high-quality app for users, hiring an experienced React Native developer is a good idea. We have been working with React Native since it’s inception. Write to us at info@zivost.com for a free development consultation.