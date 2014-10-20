### About

A work in progress inspired by: http://maciejczyzewski.me/2014/10/18/bloom-filters-fast-and-simple.html.

This is probably not production ready and can use a lot of performance enhancements. I merely made this to understand the basics of bloom filters.

### Usage

```ruby
bf = BloomFilter.new
bf.add "test string"
bf.add "qwerty"

puts bf.query "querty" #=> true
puts bf.query "test string" #=> true
puts bf.query "not present" #=> false
```

### Contribute

Any feedback is welcome, fork and distribute at will.
