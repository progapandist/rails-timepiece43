class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :string
    add_column :users, :owner, :boolean
  end
end
