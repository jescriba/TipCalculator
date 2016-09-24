# Pre-work - Tipper the Tip Calculator

**Tipper** is a tip calculator application for iOS.

Submitted by: **Joshua Escribano**

Time spent: **3** hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Added light/dark modes changeable in the settings

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://imgur.com/45WyZmt.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app:

- Mostly around how to set up the light/dark mode. I ended up settling on using a combination of protocols with some static
class methods to change the current theme at a global level. It was also time consuming to add all the colors in code.
- Styling the back button on the UINavigationBar which I had to dive into title text attributes for (see SettingsViewController)

## License

    Copyright 2016 Joshua Escribano

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
