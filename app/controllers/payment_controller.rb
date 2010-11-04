class PaymentController < ApplicationController

  def create
		@payment = Payment.create(params[:payment])
		if @payment.valid?
			@payment.process
			render 'processed'
		else
			redirect_to :action=>'create'
		end
  end

end
