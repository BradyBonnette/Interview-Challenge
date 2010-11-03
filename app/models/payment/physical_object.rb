class Payment::PhysicalObject < Payment

  # When a Physical Obect is ordered, a packing slip is created for shipping
  def process_order
    @action_message = "Creating Packing Slip"
  end

end
