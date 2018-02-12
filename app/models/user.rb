class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  has_many :wikis, through: :collaborations

  enum role: [:member, :premium, :admin]
  before_save { self.role ||= :member }

  def collaborations
    Collaboration.where(user_id: id)
  end

end
