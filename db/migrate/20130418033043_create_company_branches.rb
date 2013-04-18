class CreateCompanyBranches < ActiveRecord::Migration
  def change
    create_table :company_branches do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.float :ranking
      t.integer :category_id
      t.integer :city_id
      t.integer :company_id
      t.integer :admin_id
      t.integer :subscription_id

      t.timestamps
    end
  end
end
