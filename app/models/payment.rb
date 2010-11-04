class Payment < ActiveRecord::Base

  #  These are necessary to complete an order.
	validates_presence_of :customer_name, :customer_address, :customer_email

  # This is the header of the page that gets displayed after the order is processed.
  attr_accessor :action_message

  # This method will be inherited by other payment types and called by the controller. 
  # They must implement this accordingly.
  def self.process_order
  end

  # Parse out the class name, downcase it and use this for the
  # partial to render in the 'processed' view.
  def get_processed_partial
    return if self.class.name == nil

    self.class.name.split("::").last.downcase
  end

end
