# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authorization < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :user

  belongs_to :user

	validates :provider, :uid, :user_id, :presence => true

	def self.find_or_create(auth_hash)
	  unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
	    unless user = User.find_by_email(auth_hash["info"]["email"])
	    	rand_password=('0'..'z').to_a.shuffle.first(8).join
	    	user = User.create :name => auth_hash["info"]["name"],
		                       :email => auth_hash["info"]["email"],
		                       :nickname => auth_hash["info"]["nickname"],
		                       :birthday => format_facebook_date(auth_hash["extra"]["raw_info"]["birthday"]),
		                       :gender => auth_hash["extra"]["raw_info"]["gender"],
		                       :user_type => UserType.find_by_name("facebook"),
		                       :password => rand_password,
		                       :password_confirmation => rand_password
	    end
		    auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
	  end

	  auth
	end

	def self.format_facebook_date(date)
	 	return "#{date[6..9]}-#{date[0..1]}-#{date[3..4]}"
	end
end