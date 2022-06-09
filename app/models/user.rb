class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :database_authenticatable, :trackable

  has_many :participations
  has_many :user_cards
  has_many :cards, through: :user_cards

  def online?
    updated_at > 2.minutes.ago
  end


end
