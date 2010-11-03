require 'spec_helper'

describe Payment::PhysicalObject do

  before(:each) do
    @physical_object_payment = Payment::PhysicalObject.new
  end

  it "should respond to #process_order" do
    Payment::PhysicalObject.respond_to?(:process_order).should eql(true)
  end 

end
