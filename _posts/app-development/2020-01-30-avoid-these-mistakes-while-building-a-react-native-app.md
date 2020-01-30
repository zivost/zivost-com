---
layout: post
title: Avoid these mistakes while building a React Native app
featured-img: 'https://cdn.zivost.com/blogs/rn_mistake/rn_mis_2.png'
mathjax: true
---

While starting a new mobile app project, choosing the right development stack often comes as a challenge. When covering a large part of your target audience is a priority, a platform that supports all the platforms takes the lead and that is React Native.

Considering the high-quality apps that were built in React Native (Facebook, Instagram & Airbnb to name a few), the outstanding community support and a simple learning curve, React Native has gained popularity among mobile app developers.

As with most of the awesome things in this universe, React Native development also comes with some challenges.

I write this article to help you avoid certain challenges which we have already been through and wasted several hours and cups of coffee over it. Let’s jump to the problems straight away with little small talk.

## 1\. A missing key attribute in Flat List item.

If you don't specify a unique key to your FlatList item, react will re-render every time whenever an item is modified in the list. This will lead to poor performance on your app and results in bad user experience.

Providing every list item with a unique key will enable a stable identity which avoids re-rendering.

~~~JSX
<FlatList
 data={ [1,2,3,4] }
    keyExtractor={(item, index) => item.key}
    renderItem={({item}) =>
        <Text>{item}</Text>
    }
/>
~~~

The above code has an attribute **keyExtractor** which saves your app from the performance issues due to re-rendering.&nbsp;

Be sure not to miss that one out.

## 2\. Leaving **console.log()** statements in the production app.

Console.log() statements are a blessing when it comes to debugging the app. It lets you point out exactly which line in your code is not working as expected.

But, leaving **console.log()** statements in your production code will negatively affect your app performance. Eventually, your app will be slowed down due to bottlenecks in JavaScript threads.

## 3\. Binding functions inside the render method to pass params

What if I bind functions inside the render method? While rendering, it will create new methods instead of re-using the old ones\!

~~~JSX
render(){
    return(
        <TouchableOpacity onPress={this.callme.bind(this)}>
            <Text>Press Me</Text>
        </TouchableOpacity>
    )
}
~~~

In here, I iterate the **TouchableOpacity** button inside the map function. This breaks the performance optimization of the app because it creates different callbacks while rendering. You can solve this issue with binding **callme()** method either in the constructor or you can use property initializer syntax.

~~~JSX
callme = () => {
    console.log("Pressed");
}
render(){
    return(
        <TouchableOpacity onPress={this.callme}>
            <Text>Press Me</Text>
        </TouchableOpacity>
    )
}
~~~

## 3\. Layouts for Android and iOS

The layout structure of a single page on your app can be completely different on iOS and Android. You need to plan the layouts accordingly.

What works on Android might not work the same on iOS. For example, Android devices have hardware or soft back-button but none of the iOS devices does. If you plan to skip out on a back button in your UI, it will work on Android but not on iOS.

## 4\. Image Optimisation

Be it a website or a mobile app, not optimising images will turn out to be negative on your performance. While web developers have known this fact for years, mobile developers are still figuring out that un-optimised images hinder the performance.

## 5\. Use a proper Project Structure

While it may not seem to have a proper folder structure initially, a wrong project structure will make it tough for you to manage the project in the long run. Even for small apps, organising your stuff will make your life a whole lot easier.

If you need help with your structure just drop us an email, we'll be happy to help you out.

## Conclusion:

While this may not be an exhaustive list (we don’t even intend it to be), we will try to add more problems/mistakes as we encounter them. You can write to us at **info@zivost.com** if you find something important that might benefit others while React Native development.&nbsp;

Our mission is to save time and efforts of developers like us and delivering high-quality products to our users.

If you want to build a high-quality app for users, hiring an experienced React Native developer is a good idea. We have been working with React Native since it’s inception.&nbsp;

Write to us at **info@zivost.com** for a free development consultation.