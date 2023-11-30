class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :title
      t.string :description
      t.string :name
      t.string :phone
      t.string :address
      t.string :email
    end
  end
end
