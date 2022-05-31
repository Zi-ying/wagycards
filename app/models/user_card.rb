class UserCard < ApplicationRecord
  belongs_to :user
  belongs_to :card
  has_many :participation_cards
end
