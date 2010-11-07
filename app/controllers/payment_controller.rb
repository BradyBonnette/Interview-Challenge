require 'subclasser'

class PaymentController < ApplicationController

  def index
    @payment_list_items = get_payment_list_items
    @payment = Payment.new
  end

  def create
		# Return immedately with an error if the payment params are not included.
		if params[:payment].nil? || params[:payment].empty?
			flash[:notice] = "Please ensure that you have filled out all fields."
			redirect_to :action=>'index'
			return
		end

		# Transform the payment to the proper subclass.
		transform_payment_type

		if @payment.valid?
			# Process the order, implementation depends on the subclass.
			@payment.process_order
			render 'processed'
		else
			flash[:notice] = "Please ensure that you have filled out all fields."
			redirect_to :action=>'index'
		end
  end

  private

  # Extract all the Payment subclasses and populate a select-box-
  # suitable array for the view.
  def get_payment_list_items
    @subclasses = Subclasser.get_subclasses_for(:Payment)

    # Split on CamelCase, for prettier-looking selection items in the view
    @subclasses.collect{|s| [s.split("::").last.split(/(?<!^)(?=[A-Z])/).join(" "),s]}
  end

	def transform_payment_type
		# Delete the type so that its not mass-assigned.  Bad.
		payment_type = params[:payment].delete(:type)

		#Create, transform, save
		@payment = Payment.new(params[:payment]).becomes(eval payment_type)
		@payment.type = payment_type
		@payment.save
	end
end
