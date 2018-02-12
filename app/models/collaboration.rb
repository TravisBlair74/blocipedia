class Collaboration < ApplicationRecord
  belongs_to :wiki
  has_many :users

  def self.wiki
    Wiki.where( id: pluck(:wiki_id) )
  end

  def self.users
    User.where( id: pluck(:user_id) )
  end

end
