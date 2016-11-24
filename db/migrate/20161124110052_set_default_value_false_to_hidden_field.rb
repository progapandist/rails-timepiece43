class SetDefaultValueFalseToHiddenField < ActiveRecord::Migration[5.0]
  def change
    change_column :watches, :hidden, :boolean, :default => false
  end
end
