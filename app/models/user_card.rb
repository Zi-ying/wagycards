class UserCard < ApplicationRecord
  belongs_to :user
  belongs_to :card
  has_many :participation_cards

  validates_uniqueness_of :card_id, scope: [:user_id]

end
