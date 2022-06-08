class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :participation_cards
  after_create :create_participation_cards

  def create_participation_cards
    user.user_cards.sample(8).each do |user_card|
      ParticipationCard.create!(user_card_id: user_card.id, participation: self)
    end
  end
end
