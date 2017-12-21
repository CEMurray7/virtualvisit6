class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.date :dob
      t.string :email
      t.string :phone_number
      t.string :gender
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
