
module ::CompositingArray::Unique::Interface

  include ::UniqueArray::Interface

  instances_identify_as!( ::CompositingArray::Unique )

  ##################################################################################################
      private ######################################################################################
  ##################################################################################################

  ########################################
  #  update_as_sub_array_for_parent_set  #
  ########################################
  
  def update_as_sub_array_for_parent_set( index, object )
    
    super unless @unique_keys.has_key?( object )
    
  end

  ###########################################
  #  update_as_sub_array_for_parent_insert  #
  ###########################################

  def update_as_sub_array_for_parent_insert( index, *objects )
    
    # new parent indexes have been inserted at index in parent
    
    # get rid of objects already inserted
    indexes_to_delete = [ ]
    objects.each_with_index do |this_object, index|
      if @unique_keys.has_key?( this_object )
        indexes_to_delete.push( index )
      else
        @unique_keys[ this_object ] = true
      end
    end
    indexes_to_delete.sort.reverse.each do |this_index|
      objects.delete_at( this_index )
    end
    return false if objects.empty?

    super

  end
  
end
