class ParticipationCard < ApplicationRecord
  belongs_to :participation
  belongs_to :user_card
  has_many :round_cards
end
