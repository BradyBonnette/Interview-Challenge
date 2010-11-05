class PaymentController < ApplicationController

  def index
    @payment = Payment.new
  end

  def create

		if params[:payment].nil? || params[:payment].empty?
			redirect_to :action=>'create'
			return
		end

		@payment = Payment.create(params[:payment]).becomes(eval params[:payment][:type])

		if @payment.valid?
			@payment.process_order
			render 'processed'
		else
			redirect_to :action=>'create'
		end
  end

end
