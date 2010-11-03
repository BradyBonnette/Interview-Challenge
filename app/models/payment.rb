class Payment < ActiveRecord::Base
	validates_presence_of :customer_name, :customer_address, :customer_email

  def self.process_order
  end

end
