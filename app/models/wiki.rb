class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations
end
