![MastodonKit](https://cloud.githubusercontent.com/assets/19753339/26019845/f64df19a-3778-11e7-8482-e09e187f3923.png)

[![Build Status](https://travis-ci.org/MastodonKit/MastodonKit.svg?branch=master)](https://travis-ci.org/MastodonKit/MastodonKit)
[![Code Coverage](http://codecov.io/github/MastodonKit/MastodonKit/branch/master/graphs/badge.svg)](http://codecov.io/github/MastodonKit/MastodonKit)
[![SwiftPM Compatible](https://img.shields.io/badge/Swift_Package_Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![SwiftPM Version](https://img.shields.io/github/release/MastodonKit/MastodonKit.svg?colorB=brightgreen)](https://github.com/MastodonKit/MastodonKit/releases)
[![CocoaPods](https://img.shields.io/cocoapods/v/MastodonKit.svg?colorB=brightgreen)](https://github.com/MastodonKit/MastodonKit)

**MastodonKit** is a Swift Framework built using Swift Package Manager that wraps the Mastodon API. It covers all the endpoints and entities from [Mastodon's API](https://github.com/tootsuite/documentation/blob/master/Using-the-API/API.md) and is designed to be simple to use.

Visit [MastodonKit's Complete Documentation](https://mastodonkit.github.io/MastodonKit) for examples and descriptions of all the methods available. These are some of the examples of what you'll find there:

* [How to Install](https://mastodonkit.github.io/MastodonKit/docs/how-to-install.html)
* [How to Build and Test](https://mastodonkit.github.io/MastodonKit/docs/how-to-build-and-test.html)
* [Initializing the Client](https://mastodonkit.github.io/MastodonKit/docs/initializing-the-client.html)
* [Making Requests](https://mastodonkit.github.io/MastodonKit/docs/making-requests.html)
* [Ranges and Limits](https://mastodonkit.github.io/MastodonKit/docs/ranges-and-limits.html)
* [Uploading Media Attachments](https://mastodonkit.github.io/MastodonKit/docs/uploading-media-attachments.html)

By the way, if you want to get in touch with me, [toot me](https://mastodon.social/@otaviocc).

# Contributors

* [Ornithologist Coder (@ornithocoder)](https://mastodon.technology/@ornithocoder)
* [Paul Schifferer (@exsortis)](https://github.com/exsortis)
* [Valerii Hiora (@vhbit)](https://github.com/vhbit)
* [Calv Collins (@calv@mastodon.social)](https://github.com/calvcoll)
* [Frank Rausch](https://github.com/frankrausch)
* [Adam Lickel](https://github.com/lickel)
* [Bei Li (@libei@mastodon.social)](https://github.com/kylinroc)
* [Tony Arnold](https://github.com/tonyarnold)
* [Taylor Lineman](https://github.com/actuallytaylor)

# This Branch
This branch adds support for a significant amount of the new Mastodon APIs. The apis with support added are:
1. Search API V2
2. Account Fields
3. Lookup by webfinger
4. Updated Tag models
5. Bookmark and Unbookmark API endpoints
6. Poll APIs
7. Web Push Subscription endpoint
8. Updated to media posting v2 api
9. Added support for filters
10. Added localized descriptions to erros
11. Updated notifications to support 
12. Added Marker support
13. Added trending APIs
14. Added Tags APIs
15. Updated the Instances API to the newest model version and added all the API calls.

# License

Copyright (c) 2017 Ornithologist Coder. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
