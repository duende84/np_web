class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :password
      t.string :email
      t.string :phone
      t.date :birthday
      t.string :gender
      t.integer :city_id
      t.integer :user_type_id

      t.timestamps
    end
  end
end
