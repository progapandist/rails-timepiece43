class CreateWatches < ActiveRecord::Migration[5.0]
  def change
    create_table :watches do |t|
      t.text :description
      t.decimal :price
      t.string :name
      t.boolean :available
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
