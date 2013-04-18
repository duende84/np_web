# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  nit        :string(255)
#  name       :string(255)
#  email      :string(255)
#  web_site   :string(255)
#  owner_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :email, :name, :nit, :owner_id, :web_site, :owner

  belongs_to :owner, class_name: 'User'
  has_many :company_branches
end
