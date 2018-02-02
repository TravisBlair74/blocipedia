class User < ApplicationRecord
  has_many :wikis
  before_save { self.role ||= :member }
  enum role: [:member, :premium, :admin]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
