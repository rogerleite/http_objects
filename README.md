# HttpObjects

HTTP 1.1 by the spec, specially headers.

## Installation

Add this line to your application's Gemfile:

    gem 'http_objects'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install http_objects

## Usage

``` ruby
#require 'rubygems'
require 'http_objects'

headers = HttpObjects::Headers.new

# it's a normal hash (for normal keys)
headers["key"] = "value"

# for HTTP headers, you have objects
headers["Content-Type"] = "text/html;Charset=utf-8"

# one can check if header exist
puts headers.content_type? # => true

# one can access raw value
puts headers.content_type! # => "text/html;Charset=utf-8"

# one can access the value
puts headers.content_type.value # => "text/html"

# one can read directives
puts headers.content_type['charset'] # => "utf-8"

# finally one can access the object
puts headers.content_type.inspect # => #<HttpObjects::Headers::MediaType ...>

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
