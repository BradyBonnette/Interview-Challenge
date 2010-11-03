class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.string :type
      t.string :customer_name
      t.string :customer_address
      t.string :customer_phone
      t.string :customer_email
      t.datetime :date_received
      t.datetime :date_processed

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
