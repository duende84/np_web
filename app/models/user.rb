# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  nickname        :string(255)
#  password        :string(255)
#  email           :string(255)
#  phone           :string(255)
#  birthday        :date
#  gender          :string(255)
#  city_id         :integer
#  user_type_id    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :birthday, :city_id, :email, :gender, :name, :nickname, :password, :phone, :user_type_id, :password_confirmation

  has_many :authorizations

	has_secure_password

  before_save { email.downcase! }
  before_save :create_remember_token

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
    self.nickname = "#{first_name}#{(rand() * 100).to_i}"
  end

  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
