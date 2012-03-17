require 'date'

Gem::Specification.new do |spec|

  spec.name                      =  'compositing-array-unique'
  spec.rubyforge_project         =  'compositing-array-unique'
  spec.version                   =  '1.0.0'

  spec.summary                   =  "Provides CompositingArray::Unique."
  spec.description               =  "An implementation of Array that permits chaining, where children inherit changes to parent and where parent settings can be overridden in children, and that retains sorted order, ensuring inserted values are unique."

  spec.authors                   =  [ 'Asher' ]
  spec.email                     =  'asher@ridiculouspower.com'
  spec.homepage                  =  'http://rubygems.org/gems/compositing-array-unique'

  spec.date                      =  Date.today.to_s
  
  spec.files                     = Dir[ '{lib,spec}/**/*',
                                        'README*', 
                                        'LICENSE*' ]

end
