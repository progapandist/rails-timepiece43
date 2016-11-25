class RemoveOwnerFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :owner, :boolean
  end
end
