
require 'array/unique'
require 'array/compositing'
#require_relative '../../../../../hooked_objects/array-unique/lib/array-unique.rb'
#require_relative '../../../../array-compositing/lib/array/compositing.rb'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

class ::Array::Unique::Compositing < ::Array::Hooked

  include ::Array::Unique::Compositing::ArrayInterface
  
end
