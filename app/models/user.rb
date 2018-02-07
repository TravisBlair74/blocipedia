class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  enum role: [:member, :premium, :admin]
  before_save { self.role ||= :member }

end
