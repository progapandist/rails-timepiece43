class RenameBookingsToBooking < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :bookings_id, :booking_id
  end
end
