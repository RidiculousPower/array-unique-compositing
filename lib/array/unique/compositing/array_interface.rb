# -*- encoding : utf-8 -*-

module ::Array::Unique::Compositing::ArrayInterface

  include ::Array::Unique::ArrayInterface
  include ::Array::Compositing::ArrayInterface

  instances_identify_as!( ::Array::Unique::Compositing )

  extend ::Module::Cluster

  cluster( :unique_compositing_array_interface ).before_include.cascade_to( :class ) do |hooked_instance|
    
    hooked_instance.class_eval do
      
      alias_method :unique_set, :[]= unless method_defined?( :unique_set )

      alias_method :unique_insert, :insert unless method_defined?( :unique_insert )

      alias_method :unique_delete_at, :delete_at unless method_defined?( :unique_delete_at )
      
    end
    
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
