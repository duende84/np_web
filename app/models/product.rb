# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  price       :float
#  description :string(255)
#  stock       :integer
#  branch_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  attr_accessible :branch_id, :description, :name, :price, :stock, :branch, :image, :remote_image_url
  belongs_to :branch, class_name: 'Company'
  mount_uploader :image, ProductImageUploader
end
