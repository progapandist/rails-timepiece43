class AddOwnerToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :owner, :boolean
  end
end
