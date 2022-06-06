class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :participation_card
  after_create :create_participation_cards

  def create_participation_cards
    user.user_cards.sample(8).each do |user_card|
      Participation_card.create(user_card: user_card, participation: self)
    end
  end
end
