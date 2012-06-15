
require 'unique-array'

if $__compositing_array__spec__development
  require_relative '../../compositing-array/lib/compositing-array.rb'
else
  require 'compositing-array'
end

class ::CompositingArray
end
class ::CompositingArray::Unique < ::CompositingArray
end

basepath = 'compositing-array-unique/CompositingArray/Unique'

files = [

  'Interface'
    
]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end

require_relative( basepath + '.rb' )
