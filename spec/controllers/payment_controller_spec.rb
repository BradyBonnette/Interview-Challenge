require 'spec_helper'

describe PaymentController do

	describe "POST 'create'" do

		before do
			@params = {'customer_name'=> 'Bob', 
				'customer_address'=> 'Beverly Hills, 90210',
				'customer_email'=>'bob@bob.com'
			}
		end

		before(:each) do
			@payment = mock_model(Payment)
		end

		it "should have invalid payment if required parameters are missing" do
			Payment.should_receive(:create).with(nil).and_return(@payment)
			@payment.should_receive(:valid?).and_return(false)
			post 'create', {:payment=>nil}
		end

		it "should redirect back to the main page if payment is invalid" do
			Payment.should_receive(:create).with(@params).and_return(@payment)
			@payment.should_receive(:valid?).and_return(false)
			post 'create', {:payment=>@params}
			response.should redirect_to(:action => 'create')
		end

		it "should redirect back to the main page if payment failed to process" do
			Payment.should_receive(:create).with(@params).and_return(@payment)
			@payment.should_receive(:valid?).and_return(true)
			@payment.should_receive(:process).and_return(true)
			post 'create', {:payment=>@params}
		end

		it "should render processed page if payment valid and processed" do
			Payment.should_receive(:create).with(@params).and_return(@payment)
			@payment.should_receive(:valid?).and_return(true)
			@payment.should_receive(:process).and_return(true)
			post 'create', {:payment=>@params}
			response.should render_template('processed')
		end
	end
end
