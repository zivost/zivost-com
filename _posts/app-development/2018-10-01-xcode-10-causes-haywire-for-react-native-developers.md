---
layout: post
title: XCODE 10 causes haywire for React Native Developers
featured-img: https://cdn.zivost.com/blogs/xcode_fix/blog_header.jpg
image: https://cdn.zivost.com/blogs/xcode_fix/blog_header.jpg
author: rohit_hazra
keywords: xcode,double-conversion,config.h,lexical,xcode10,glog,libfishhook.a,react-native
mathjax: true
---

React Native today is one of the (if not the most) popular languages to build apps for Android and iOS. Companies that are building on react-native consist of AirBnB, Facebook, UberEats, Discord, Tesla and many more, giving react-native a huge community that increases the popularity and stability of the language.

Recently Apple announced MacOS Mojave, iOS12 and launched the new iPhones (iPhone XS, iPhone XS Max and iPhone XR) and with these announcements came Xcode 10.

Xcode 10 boasts a load of new features including 'Editor enhancements', 'faster symbol downloads' and 'a new build system'. (see more at: https://developer.apple.com/xcode/whats-new/)

Like any big upgrade to an IDE, this breaks a lot of projects that may not have been upgraded from some time. Maybe you have upgraded your project but the dependencies that you have in your project may not have. Over the last few days, I have been fixing multiple projects built using various versions of react-native and it's mostly being a time consuming activity with a lot of debugging and trial-runs. So this is an effort to compile most of these errors and their solutions in a single place to ease the efforts of other developers.

Let's start.

Mostly, I found these issues with projects using`react-native <= 0.57`but you may face it in higher versions as well.

**Note: Most of these issues are just a temporary fix and will need to be repeated each time you clone your code. So it is recommended that you upgrade your react and react-native versions as soon as possible**

## Double Conversion or Lexical Issue

#### Errors covered

* Lexical or Preprocessor Issue &gt; config.h file not found.
* Lexical or Preprocessor Issue &gt; logging.h file not found. (glog/logging.h or glog/\*.h)
* Build input file double-conversion cannot be found.

The first issue you might face is the **Lexical or Preprocessor issue** or **Double Conversion not found Error**. There are multiple fixes on github regarding this error, while most of them have a different method to solve it, they all end up re-compiling a third party library named`glog`which is a **C++ implementation of the Google logging module** found [here](https://github.com/google/glog).

Resolving this issue is as simple as re-building the module manually, which is more of an inconvience if anything.

Run the following commands in the root of your react-native project.

~~~bash
cd node_modules/react-native/third-party/glog-0.3.x
./configure
make
make install
~~~

Other solutions include running `../../scripts/ios-install-third-party.sh` and`../../scripts/ios-configure-glog.sh`which re-installs the third-party modules and then rebuild it. But if your project was running before the Xcode upgrade, this might not be required as you probably have the right versions of the modules.

#### Update (August 2019)

This issue is still persistent even if you init a new project using `react-native init AwesomeProject --version 0.59.10`. The version `0.59.10` was supposed to fix the Lexical issues but the situation is still the same. Thankfully the solution is still to just rebuild the glog module using the above command.

## RCTWebSocket - libfishhook.a is missing

#### Errors Covered

* `Build input file cannot be found: '.../node_modules/react-native/Libraries/WebSocket/libfishhook.a'`

#### Solution

In `Build Phases` of the target where you are getting the error

* Locate the `libfishhook.a`binary file in`Link Binary with Libraries`
* Remove `libfishhook.a` (if exists)
* Re-Add `libfishhook.a`

![https://s3.ap-south-1.amazonaws.com/zivost/xcode10_fix/ezgif.com-optimize.gif](https://cdn.zivost.com/blogs/xcode_fix/xcode_fix_libfishhook.gif)

If the following does not resolve the issue then find the `libfishhook.a`file from any project and paste it in `node_modules/react-native/Libraries/WebSocket/`. I have uploaded this file and you can also do the following in the project's root folder.

~~~bash
wget https://s3.ap-south-1.amazonaws.com/zivost/xcode10_fix/libfishhook.a -O node_modules/react-native/Libraries/WebSocket/libfishhook.a
~~~

## Semantic Issue

This error seems to only occur with `react-native <= 0.56` and is fixed with `v0.57`. It is recommended to upgrade the version and this process should be faily easier. Remember if you upgrade manually, always create a new branch and test everything before commiting.

*Note: If you upgrade the react native version, and re-run `npm install` you may face the other errors from this blog that you may have already fixed, so just repeat that process.*

#### Errors Covered

* `No member named '__rip' in '__darwin_i386_thread_state'; did you mean '__eip'?`

#### Solution

Run the following commands in the root of your react-native project.

~~~bash
cd node_modules/react-native/third-party/glog-0.3.x
./configure --host arm-apple-darwin
make
make install
~~~

Edit `node_modules/react-native/third-party/glog-0.3.4/src/config.h`

Replace:

~~~objective-c
/* How to access the PC from a struct ucontext */
#define PC_FROM_UCONTEXT uc_mcontext->__ss.__rip
~~~

With:

~~~objective-c
/* How to access the PC from a struct ucontext */
#if defined(__arm__) || defined(__arm64__)
#define PC_FROM_UCONTEXT uc_mcontext->__ss.__pc
#else
#define PC_FROM_UCONTEXT uc_mcontext->__ss.__rip
#endif
~~~

[Issue/Solution Reference](https://github.com/facebook/react-native/issues/19839#issuecomment-422390104)

## Multiple commands produce … Info.plist

~~~bash
Showing Recent Messages
:-1: Multiple commands produce '/Users/rohithazra/Library/Developer/Xcode/DerivedData/eSportsGlobalGamers-gpegqsfkbrlhfkboegxcboihfklf/Build/Products/Debug-iphonesimulator/eSportsGlobalGamers.app/Info.plist':
1) Target 'eSportsGlobalGamers' (project 'eSportsGlobalGamers') has copy command from '/Users/rohithazra/Work/brisik-mobile/ios/eSportsGlobalGamers/Info.plist' to '/Users/rohithazra/Library/Developer/Xcode/DerivedData/eSportsGlobalGamers-gpegqsfkbrlhfkboegxcboihfklf/Build/Products/Debug-iphonesimulator/eSportsGlobalGamers.app/Info.plist'
2) Target 'eSportsGlobalGamers' (project 'eSportsGlobalGamers') has process command with output '/Users/rohithazra/Library/Developer/Xcode/DerivedData/eSportsGlobalGamers-gpegqsfkbrlhfkboegxcboihfklf/Build/Products/Debug-iphonesimulator/eSportsGlobalGamers.app/Info.plist'
~~~

Now this error I faced in an older version of `react-native v0.4x` and can easily be fixed by removing `Info.plist` from `Build Phases` of your project's `Targets`. See image for reference.

![https://s3.ap-south-1.amazonaws.com/zivost/xcode10_fix/info_plist_error.png](https://cdn.zivost.com/blogs/xcode_fix/info_plist_error.png)

## Multiple linking errors

You may encounter multiple errors related to linking or missing libraries. To solve those issues you should try the following.

In the root folder of your react-native project

* Execute `react-native link`

#### OR

In `Build Phases` of the target where you are getting the error

* Locate the library/file in `Copy Bundle Resources` and/or `Link Binary with Libraries`
* Remove the library/file
* Re-Add the library/file

While the above errors do cover the most major errors, you may still face certain unknown errors depending on your project and it's dependencies. You can always raise an issue on GitHub or StackOverflow and also reach out to me on Twitter @rohithzr

## What do I think of the new build system?

The new build system definately seems faster and more optimized than ever before. There are a few caveats and some things are breaking but it does not mean that the build system is bad or was not tested thoroughly, it simply means that a few older libraries fail to work, which you should upgrade whenever you get the chance.

*PS: The Dark mode is Dank\!*