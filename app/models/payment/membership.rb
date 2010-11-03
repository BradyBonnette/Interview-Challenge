class Payment::Membership < Payment

  # When a Membership is processed, an email is sent to the owner
  def process_order
    @action_message = "Sending E-mail to #{self.customer_name}"
  end

end
