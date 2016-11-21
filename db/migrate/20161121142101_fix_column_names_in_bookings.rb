class FixColumnNamesInBookings < ActiveRecord::Migration[5.0]
  def change
    rename_column :bookings, :rent_start, :start
    rename_column :bookings, :rent_end, :end
  end
end
