require 'spec_helper'

describe Payment do

	before(:each) do
		@payment = Payment.new(:customer_name=>"Bob", :customer_address=>"Beverly Hills, 90210")
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

end
