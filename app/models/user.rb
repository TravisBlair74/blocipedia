class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  has_many :collaborations
  has_many :wiki_collaborations, through: :collaborations, source: :wiki

  enum role: [:member, :premium, :admin]
  before_save { self.role ||= :member }
end
