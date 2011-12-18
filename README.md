# HTTP Status Cats

Rack middleware replacing status codes with pictures of cats.

* [Source](http://www.flickr.com/photos/girliemac/sets/72157628409467125/detail/)

## Usage

Install:

```
gem install status_cats
```

Place inside your rackup file:

``` ruby
require 'status_cats'
use StatusCats::Middleware
```
