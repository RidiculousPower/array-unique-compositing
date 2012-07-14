
require 'array/unique'
require 'array/compositing'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

class ::Array::Unique::Compositing < ::Array::Hooked

  include ::Array::Unique::Compositing::ArrayInterface
  
end
