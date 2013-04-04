# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  slogan     :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gmaps      :boolean
#

class City < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name, :slogan, :country

  belongs_to :country

  acts_as_gmappable

  def gmaps4rails_address
	  "#{name}, #{slogan}"
	end
end
