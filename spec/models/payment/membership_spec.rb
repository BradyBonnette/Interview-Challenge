require 'spec_helper'

describe Payment::Membership do

  before(:each) do
    @membership_payment = Payment::Membership.new(:customer_name=>"bob",
                                                 :customer_address=>"Beverly Hills, 90210",
                                                 :customer_email=>"bob@bob.com")
  end

  it "should respond to #process_order" do
    Payment::Membership.respond_to?(:process_order).should eql(true)
  end 

  it "should have an action message of 'Sending E-mail to _____' only after #process_order" do
    @membership_payment.save
    @membership_payment.action_message.should eql(nil)
    @membership_payment.process_order
    @membership_payment.action_message.should eql("Sending E-mail to #{@membership_payment.customer_name}")
  end

end
