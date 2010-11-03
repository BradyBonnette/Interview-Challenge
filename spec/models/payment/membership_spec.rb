require 'spec_helper'

describe Payment::Membership do

  before(:each) do
    @membership_payment = Payment::Membership.new
  end

  it "should respond to #process_order" do
    Payment::Membership.respond_to?(:process_order).should eql(true)
  end 

end
