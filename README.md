# Unique Compositing Array #

http://rubygems.org/gems/array-unique-compositing

# Description #

Provides Array::Unique::Compositing.

# Summary #

An implementation of Array that permits chaining, where children inherit changes to parent and where parent settings can be overridden in children, and that ensures inserted values are unique.

# Install #

* sudo gem install array-unique-compositing

# Usage #

```ruby
compositing_array = Array::Unique::Compositing.new
sub_compositing_array = Array::Unique::Compositing.new( compositing_array )

compositing_array.push( :A )
# compositing_array
# => [ :A ]
# sub_compositing_array
# => [ :A ]
compositing_array.push( :A )
# compositing_array
# => [ :A ]
# sub_compositing_array
# => [ :A ]

compositing_array.delete_at( 0 )
# compositing_array
# => [ ]
# sub_compositing_array
# => [ ]

sub_compositing_array.push( :A )
# compositing_array
# => [ ]
# sub_compositing_array
# => [ :A ]
```

# License #

  (The MIT License)

  Copyright (c) Asher

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  'Software'), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.