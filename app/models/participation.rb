class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :participation_cards
end
