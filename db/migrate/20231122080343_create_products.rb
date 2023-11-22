class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.references :category, null: true, foreign_key: true

      t.timestamps
    end
  end
end