class PaymentController < ApplicationController

  def index
    @payment = Payment.new
  end

  def create
		@payment = Payment.create(params[:payment]).becomes(eval params[:payment][:type])
    puts @payment
		if @payment.valid?
			@payment.process_order
      puts @payment
			render 'processed'
		else
			redirect_to :action=>'create'
		end
  end

end
