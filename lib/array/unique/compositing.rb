# -*- encoding : utf-8 -*-

require 'array/unique'
require 'array/compositing'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

class ::Array::Unique::Compositing < ::Array::Hooked

  include ::Array::Unique::Compositing::ArrayInterface
  
end

# If we don't explicitly set this then we will end up with ::Array::Compositing::Unique pointing to ::Array::Unique.
::Array::Compositing.const_set( :Unique, ::Array::Unique::Compositing )
