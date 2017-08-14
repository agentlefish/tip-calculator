# Pre-work - *Tip Calculator*

**Tip Calculator** is a tip calculator application for iOS.

Submitted by: **Xiang Yu**

Time spent: **4** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations - split payment section fade in
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] Non continuous slider bar to select the number of people to share the bill and update the amount each should pay

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/F7YvKej.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** Pretty straight forward so far. Outlets in swift code are links or references to the UI component in storyboard. So we can edit the properties or call member functions of the outlet object in swift code to change the UI component. Actions are functions that will be triggered by user or system events to do something based on the type of event.
Bonus Answer:Looks like the UI component are defined in the xml node in the storyboard and the outlets and actions are created under connection node. So my guess is when a user do anything in the swift code to change the property of a outlet, it will go to the connection to find the corresponding xml node and change the properties inside. For actions, when there's an event triggered on the UI component, it will look for the action in the action list under connection to find the event listener in the swift code..

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** A strong reference cycle for closures can appear when 1. there's a closure assigned to a class property which creates a strong reference from class instance to the closure and 2. that closure accesses some properties or calls member methods of the class instance 'self' which creates a strong reference from the closure to the class instance. A lazy property can be used in the closure assignment to make sure the 'self' instance can be accessed without problem to create this cycle issue. 


## License

    Copyright 2017 Xiang Yu

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
