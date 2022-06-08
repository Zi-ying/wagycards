class RoundCard < ApplicationRecord
  belongs_to :round
  belongs_to :participation_card
  validates :progress, presence: true


  def points
    self.participation_card.user_card.card.points
  end
end
