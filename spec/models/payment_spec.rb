require 'spec_helper'
require 'subclasser'

describe Payment do

	before do
		@subclass_names = Subclasser.get_subclasses_for(:payment)
	end

	before(:each) do
		@payment = Payment.new(:customer_name=>"Bob", :customer_address=>"Beverly Hills, 90210",
													 :customer_email=>"bob@bob.com")
	end

	it "should be invalid when customer name is not specified" do
		@payment.customer_name = nil
		@payment.valid?.should == false
	end

	it "should be invalid when customer address is not specified" do
		@payment.customer_address = nil
		@payment.valid?.should == false
	end

	it "should be invalid when customer email address is not specified" do
		@payment.customer_email = nil
		@payment.valid?.should == false
	end

	it "should get the correct partial form name based from the 'Payment Type' using #get_processed_partial" do
		@payment.stub!(:get_class_name).and_return("Payment::PaymentType")
		@payment.get_processed_partial.should eql("PaymentType".downcase)
	end

	it "should have subclasses that implement #process_order" do
		@subclass_names.each do |subclass_name|
			subclass = eval(subclass_name).new
			subclass.respond_to?(:process_order).should eql(true)
		end
	end

	it "should have subclasses with an existing partial form to render" do
		@subclass_names.each do |subclass_name|
			subclass = eval(subclass_name).new
			partial_file_name = "#{Rails.root}/app/views/payment/_#{subclass.get_processed_partial}.html.erb"
			partial_file_name.should exist_on_disk
		end
	end
end
