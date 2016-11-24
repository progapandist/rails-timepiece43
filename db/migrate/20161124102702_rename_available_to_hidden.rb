class RenameAvailableToHidden < ActiveRecord::Migration[5.0]
  def change
    rename_column :watches, :available, :hidden
  end
end
