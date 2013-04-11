class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :nit
      t.string :name
      t.string :email
      t.string :web_site
      t.integer :owner_id

      t.timestamps
    end
  end
end
