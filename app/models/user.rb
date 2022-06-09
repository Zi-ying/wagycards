class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations
  has_many :user_cards
  has_many :cards, through: :user_cards
  has_many :participation_cards, through: :user_cards

  def online?
    updated_at > 2.minutes.ago
  end

  def self.sort_by_cards
    User.all.sort_by { |user| -user.cards.size }
  end
end
