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
use StatusCats
```

This will also replace valid responses, even `200`, basically making your application useless.

You can manage which status codes should be replaced with cats, by using the `:only` and `:except`
options, which take arrays or ranges.

``` ruby
use StatusCats, :only => [ 403, 404, 500 ]

# or ...

use StatusCats, :except => 200...300
```
