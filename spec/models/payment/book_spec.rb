require 'spec_helper'

describe Payment::Book do

  before(:each) do
    @book_payment = Payment::Book.new
  end

  it "should respond to #process_order" do
    Payment::Book.respond_to?(:process_order).should eql(true)
  end 

  it "should have an action message of 'Creating Duplicate Packing Slips, One For The Royalty Department' after#process_order" do
    @book_payment.save
    @book_payment.action_message.should eql(nil)
    @book_payment.process_order
    @book_payment.action_message.should eql("Creating Duplicate Packing Slips, One For The Royalty Department")
  end
end
