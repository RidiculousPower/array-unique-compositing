require 'date'

Gem::Specification.new do |spec|

  spec.name                      =  'array-unique-compositing'
  spec.rubyforge_project         =  'array-unique-compositing'
  spec.version                   =  '1.0.3'

  spec.summary                   =  "Provides Array::Unique::Compositing."
  spec.description               =  "An implementation of Array that permits chaining, where children inherit changes to parent and where parent settings can be overridden in children, and that retains sorted order, ensuring inserted values are unique."

  spec.authors                   =  [ 'Asher' ]
  spec.email                     =  'asher@ridiculouspower.com'
  spec.homepage                  =  'http://rubygems.org/gems/array-unique-compositing'

  spec.add_dependency            'array-compositing'
  spec.add_dependency            'array-unique'

  spec.date                      =  Date.today.to_s
  
  spec.files                     = Dir[ '{lib,spec}/**/*',
                                        'README*', 
                                        'LICENSE*',
                                        'CHANGELOG*' ]

end
