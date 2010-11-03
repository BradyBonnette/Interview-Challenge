class Payment::Book < Payment

  # When a Book is processed, a duplicate packing slip is to be made: one for shipping
  # and one for the royalty department
  def process_order
   @action_message = "Creating Duplicate Packing Slips, One For The Royalty Department" 
  end

end
