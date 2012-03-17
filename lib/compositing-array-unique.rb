
if $__compositing_array__spec__development
  require_relative '../../compositing-array/lib/compositing-array.rb'
else
  require 'compositing-array'
end

class ::CompositingArray::Unique < ::CompositingArray
end

require_relative 'compositing-array-unique/CompositingArray/Unique.rb'

