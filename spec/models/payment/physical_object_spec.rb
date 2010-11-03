require 'spec_helper'

describe Payment::PhysicalObject do

  before(:each) do
    @physical_object_payment = Payment::PhysicalObject.new(:customer_name=>"bob",
                                                          :customer_address=>"beverly hills",
                                                          :customer_email=>"bob@bob.com")
  end

  it "should respond to #process_order" do
    Payment::PhysicalObject.respond_to?(:process_order).should eql(true)
  end 

  it "should have an action message of 'Creating Packing Slip' only after #process_order" do
    @physical_object_payment.save
    @physical_object_payment.action_message.should eql(nil)
    @physical_object_payment.process_order
    @physical_object_payment.action_message.should eql("Creating Packing Slip")
  end

end
