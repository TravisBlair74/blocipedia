class Wiki < ApplicationRecord
  belongs_to :user
  has_many :users, through: :collaborations

  def collaborations
    Collaboration.where(wiki_id: id)
  end

end
