# == Schema Information
#
# Table name: branch_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class BranchCategory < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :company_branches
end
