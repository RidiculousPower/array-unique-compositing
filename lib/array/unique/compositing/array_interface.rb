
module ::Array::Unique::Compositing::ArrayInterface

  include ::Array::Unique::ArrayInterface
  include ::Array::Compositing::ArrayInterface

  instances_identify_as!( ::Array::Unique::Compositing )

  extend ::Module::Cluster

  cluster( :unique_compositing_array_interface ).before_include.cascade_to( :class ) do |hooked_instance|
    
    hooked_instance.class_eval do
      
      unless method_defined?( :unique_set )
        alias_method :unique_set, :[]=
      end

      unless method_defined?( :unique_insert )
        alias_method :unique_insert, :insert
      end

      unless method_defined?( :unique_delete_at )
        alias_method :unique_delete_at, :delete_at
      end
      
    end
    
  end

  #########
  #  []=  #
  #########

  def []=( local_index, object )
    
    did_set = false

    if @unique_keys.has_key?( object )                              and 
       parent_index = @parent_index_map.parent_index( local_index ) and 
       @parent_composite_object[ parent_index ] == object
      
      @parent_index_map.local_set( local_index )
    else
      super
    end
    
    return did_set
    
  end
  
  ##################################################################################################
      private ######################################################################################
  ##################################################################################################

  #####################################
  #  lazy_set_parent_element_in_self  #
  #####################################

  def lazy_set_parent_element_in_self( local_index, *optional_object )
  
    object = super
    
    @unique_keys[ object ] = true
    
  end
  
  ###########################
  #  update_for_parent_set  #
  ###########################
  
  def update_for_parent_set( parent_index, object )
    
    called_super = false

    unless @unique_keys.has_key?( object )
      @unique_keys[ object ] = true
      called_super = true
      super
    end
    
    return called_super
    
  end

  ##############################
  #  update_for_parent_insert  #
  ##############################

  def update_for_parent_insert( parent_index, object )
    
    called_super = false
    
    unless @unique_keys.has_key?( object )
      @unique_keys[ object ] = true
      called_super = true
      super
    end
    
    return called_super
  
  end

  #################################
  #  update_for_parent_delete_at  #
  #################################

  def update_for_parent_delete_at( parent_index, object )
    
    if did_delete = super
      @unique_keys.delete( object )
    end
    
    return did_delete
      
  end
  
end
