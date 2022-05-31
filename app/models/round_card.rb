class RoundCard < ApplicationRecord
  belongs_to :round
  belongs_to :participation_card

  validates :progress, presence: true
end
