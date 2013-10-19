# -*- encoding : utf-8 -*-

module ::Array::Unique::Compositing::ArrayInterface

  include ::Array::Unique::ArrayInterface
  include ::Array::Compositing::ArrayInterface

  instances_identify_as!( ::Array::Unique::Compositing )

  ################
  #  unique_set  #
  ################

  alias_method :unique_set, :[]=

  ###################
  #  unique_insert  #
  ###################

  alias_method :unique_insert, :insert

  ######################
  #  unique_delete_at  #
  ######################

  alias_method :unique_delete_at, :delete_at

  #####################
  #  register_parent  #
  #####################
  
  ###
  # Register a parent for element inheritance.
  #
  # @param [Array::Compositing] parent_array
  #
  #        Instance from which instance will inherit elements.
  #
  # @param [Integer] insert_at_index
  #
  #        Index where parent elements will be inserted.
  #        Default is that new parent elements will be inserted after last existing parent element.
  #
  # @return [Array::Compositing] 
  #
  #         Self.
  #
  def register_parent( parent_array, insert_at_index = size )
    
    load_parent_state
    
    super
    
  end
  
  ###########################
  #  register_parent_index  #
  ###########################
  
  def register_parent_index( parent_array, parent_index, insert_at_index )
    
    registered = true

    if already_include?( parent_array[ parent_index ] )
      registered = false
    else
      super
    end
    
    return registered
    
  end
  
  #####################################
  #  lazy_set_parent_element_in_self  #
  #####################################

  def lazy_set_parent_element_in_self( local_index, optional_object = nil, passed_optional_object = false )
  
    add_to_unique_objects( object = super )
    
    return object
    
  end
  
  ###########################
  #  update_for_parent_set  #
  ###########################
  
  def update_for_parent_set( parent_array, parent_index, object )
    
    called_super = false

    if already_include?( object )
      @cascade_controller.parent_set_without_child_set( parent_array, parent_index )
    else
      add_to_unique_objects( object )
      called_super = true
      super
    end
    
    return called_super
    
  end

  ##############################
  #  update_for_parent_insert  #
  ##############################

  def update_for_parent_insert( parent_array, requested_parent_index, parent_index, object )
    
    called_super = false
    
    if already_include?( object )
      @cascade_controller.parent_insert_without_child_insert( parent_array, parent_index, 1 )
    else
      add_to_unique_objects( object )
      called_super = true
      super
    end
    
    return called_super
  
  end

  #################################
  #  update_for_parent_delete_at  #
  #################################

  def update_for_parent_delete_at( parent_array, parent_index, object )
    
    delete_from_unique_objects( object ) if did_delete = super
    
    return did_delete
      
  end
  
end
