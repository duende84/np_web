class AddImageToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :image, :string
  end
end
