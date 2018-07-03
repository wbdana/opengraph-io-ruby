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

Installation is simple:

```gem install opengraph-io```

## Usage

#### Initialization

To use the client, you must first initialize an instance of the class with your ```app_id```. First, ```require 'opengraph-io'``` and then initialize an instance of the OpenGraphIO, passing it an options hash containing the required ```app_id``` key as a string:

```rb
require 'opengraph-io'
opengraph = OpenGraphIO.new({app_id: 'your_app_id_here!'})
```

#### Initialization with Setting Default Options

You may also initialize your OpenGraphIO instance with default options. For example, if you would always like to perform a ```full_render```, you can pass that parameter in the options hash at initialization along with your ```app_id```:

```rb
require 'opengraph-io'
opengraph = OpenGraphIO.new({app_id: 'your_app_id_here!', full_render: true})
```

This OpenGraphIO instance will default to performing a ```full_render``` whenever you request OpenGraph tags, unless you later decide to override this option in your request (see below!).

If you do not pass any options besides the required ```app_id```, the defaults will be used:

```rb
cache_ok: true
full_render: false
version: '1.1'
```

#### Requesting OpenGraph Tags

You can request OpenGraph tags by calling ```get_site_info``` on your OpenGraphIO instance and passing it your target site as a string.

```rb
opengraph.get_site_info('https://github.com')
```

This will return a hash containing the response. See [https://www.opengraph.io/documentation/](https://www.opengraph.io/documentation/) for an example response.

#### Requesting OpenGraph Tags with Overridden Options

```OpenGraphIO#get_site_info``` takes an optional second argument, consisting of an ```options``` hash, similar to the ```options``` hash used at initialization. The options supplied here will override the default options set at initialization for this request. For example, let's say you initialize your ```OpenGraphIO``` instance like this:

```rb
require 'opengraph-io'
opengraph = OpenGraphIO.new({app_id: 'your_app_id_here!'})
```

You can use this instance to get a response using the ```full_render``` option and disabling the ```cache_ok``` option like so:

```rb
opengraph.get_site_info('https://github.com', {full_render: true, cache_ok: false})
```

## Support

Please feel free to reach out any time with questions or suggestions by adding to the issues for this repo, or if you'd prefer, head over to [https://www.opengraph.io/support/](https://www.opengraph.io/support/) and drop us a line!

## License

MIT License

Copyright (c) William Dana

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
