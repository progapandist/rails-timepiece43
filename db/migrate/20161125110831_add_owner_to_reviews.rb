class AddOwnerToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :owner, :boolean
  end
end
