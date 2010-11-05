require 'spec_helper'

describe PaymentController do

	describe "POST 'create'" do

		before do
			@params = {"payment"=>{"customer_name" => "Bob", 
				"customer_address"=> "Beverly Hills, 90210",
				"customer_email"=>"bob@bob.com",
				"type"=>"Payment::Book"
			}}
		end

		before(:each) do
			@payment = mock_model(Payment)
		end

		it "should have invalid payment if required parameters are missing" do
			post 'create', {:payment=>nil}
			response.should redirect_to(:action => 'create')
		end

		it "should redirect back to the main page if payment is invalid" do
			Payment.stub_chain(:create, :becomes).and_return(@payment)
			@payment.should_receive(:valid?).and_return(false)
			post 'create', @params
			response.should redirect_to(:action => 'create')
		end

		it "should render processed page if payment valid and processed" do
			Payment.stub_chain(:create, :becomes).and_return(@payment)
			@payment.should_receive(:valid?).and_return(true)
			@payment.should_receive(:process_order)
			post 'create', @params
			response.should render_template('processed')
		end
	end
end
