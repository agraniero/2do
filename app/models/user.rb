class User < ApplicationRecord
  has_secure_password
  has_many :lists
  has_many :items, through: :lists
  validates :email, :presence => true
  validates :email, uniqueness: true
  validates :password, presence: true

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:email => auth_hash['info']['email']).first_or_create do |user|
      user.password = SecureRandom.hex
      user.password_confirmation= user.password
    end
  end
end
