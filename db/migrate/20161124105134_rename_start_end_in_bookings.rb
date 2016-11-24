class RenameStartEndInBookings < ActiveRecord::Migration[5.0]
  def change
    rename_column :bookings, :start, :start_date
    rename_column :bookings, :end, :end_date
  end
end
