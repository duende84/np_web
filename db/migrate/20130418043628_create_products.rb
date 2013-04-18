class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :description
      t.integer :stock
      t.integer :branch_id

      t.timestamps
    end
  end
end
