class Round < ApplicationRecord
  belongs_to :game
  has_many :round_cards
end
