# OpenGraph ( Ruby Client 0.1.0 )

[![Build Status](https://travis-ci.org/wbdana/opengraph-io-ruby.svg?branch=master)](https://travis-ci.org/wbdana/opengraph-io-ruby)
[![Coverage Status](https://coveralls.io/repos/github/wbdana/opengraph-io-ruby/badge.svg)](https://coveralls.io/github/wbdana/opengraph-io-ruby)

[OpenGraph.io](https://www.opengraph.io/) client library for [Ruby](https://www.ruby-lang.org/en/). Given a URL, the client will make a HTTP request to OpenGraph.io which will scrape the site for OpenGraph tags. If tags exist the tags will be returned to you.

Oftentimes the appropriate tags will not exist and this is where OpenGraph.io shines. It will infer what the OpenGraph tags probably would be and return them to you as ```hybridGraph```.

The ```hybridGraph``` results will always default to any OpenGraph tags that were found on the page. If only some tags were found, or none were, the missing tags will be inferred from the content on the page.

For most uses, the OpenGraph.io API is free. To get a free forever key, sign up at [OpenGraph.io](https://www.opengraph.io/).

If you end up having very heavy usage, the vast majority of projects will be totally covered using one of our inexpensive plans. Dedicated plans are also available upon request.

**NOTE** Our free plan previously required no `appId` but was unfortunately abused. The free plan still exists and is free forever, you will just have to create an account on [OpenGraph.io](https://www.opengraph.io/).

## Installation

To come!

## Usage

To come!

## Support

To come!

## License

MIT License

Copyright (c) 2018 William Dana

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
