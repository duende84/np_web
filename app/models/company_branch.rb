# == Schema Information
#
# Table name: company_branches
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  address         :string(255)
#  phone           :string(255)
#  email           :string(255)
#  ranking         :float
#  category_id     :integer
#  city_id         :integer
#  company_id      :integer
#  admin_id        :integer
#  subscription_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class CompanyBranch < ActiveRecord::Base
  attr_accessible :address, :admin_id, :category_id, :city_id, :company_id, :email, :name, :phone,
  :ranking, :subscription_id, :company, :admin, :city,:category

  belongs_to :admin, class_name: 'User'
  belongs_to :city
  belongs_to :company
  belongs_to :category, class_name: 'BranchCategory'
  #belongs_to :subscription

  has_many :products
end
