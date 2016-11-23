class AddLocationToWatch < ActiveRecord::Migration[5.0]
  def change
    add_column :watches, :location, :string
  end
end
