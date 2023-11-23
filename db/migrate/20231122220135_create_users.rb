class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email,            default: "", null: false
      t.string :password_digest,  default: "", null: false
      t.integer :role,            default: 0,  null: false
      t.string :phone,            default: "", null: false
      t.string :name,             default: "", null: false

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
