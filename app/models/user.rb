# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  nickname     :string(255)
#  password     :string(255)
#  email        :string(255)
#  phone        :string(255)
#  birthday     :date
#  gender       :string(255)
#  city_id      :integer
#  user_type_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :birthday, :city_id, :email, :gender, :name, :nickname, :password, :phone, :user_type_id, :password_confirmation

	has_secure_password

  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :nickname, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def random_nick
    first_name = self.name.split(' ').first
    self.nickname = "#{first_name}_#{(rand() * 100).to_i}"
  end
end