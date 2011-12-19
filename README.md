# Status Cats

Rack middleware replacing responses with relevant pictures of cats, based on the status code.

The pictures are made/collected by girliemac on [Flickr](http://www.flickr.com/photos/girliemac/sets/72157628409467125/detail/)

There is also an [apache module](https://gist.github.com/1476499).

## Usage

Install:

``` sh
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

## Development

Install dependencies:

``` sh
bundle install
```

Run tests:

``` sh
rake
```

You can run the demo application:

``` sh
bundle exec rackup
```

The application will trigger the response code depending on the path you visit, so visiting
[http://localhost:9292/418](http://localhost:9292/418) will respond with a teapot.


## Known issues

Status code 100 (Continue) cannot have a response body. Triggering it will cause Rack to throw up.

## License

The Ruby code in this project is released under the MIT License.

The pictures of cats are by Flickr user [girliemac](http://www.flickr.com/photos/girliemac/),
released under [this](http://creativecommons.org/licenses/by/2.0/deed.en) Creative Commons License.
