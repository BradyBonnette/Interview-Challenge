class Payment < ActiveRecord::Base

  #  These are necessary to complete an order.
	validates_presence_of :customer_name, :customer_address, :customer_email

  # This is the header of the page that gets displayed after the order is processed.
  attr_accessor :action_message

  # This method will be inherited by other payment types and called by the controller. 
  # They must implement this accordingly.
  def self.process_order
  end

end
