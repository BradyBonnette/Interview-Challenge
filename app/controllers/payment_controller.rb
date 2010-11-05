require 'subclasser'

class PaymentController < ApplicationController

  def index
    @payment_list_items = get_payment_list_items
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

  private

  # Extract all the Payment subclasses and populate a select-box
  # suitable array for the view.
  def get_payment_list_items
    @subclasses = Subclasser.get_subclasses_for(:Payment)

    # Split on CamelCase, for prettier-looking selection items
    @subclasses.collect{|s| [s.split("::").last.split(/(?<!^)(?=[A-Z])/).join(" "),s]}
  end
    
end
