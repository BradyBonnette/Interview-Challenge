require 'spec_helper'

describe Payment::Book do

  before(:each) do
    @book_payment = Payment::Book.new
  end

  it "should respond to #process_order" do
    Payment::Book.respond_to?(:process_order).should eql(true)
  end 

end
