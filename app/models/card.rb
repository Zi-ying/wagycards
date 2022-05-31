class Card < ApplicationRecord
  has_many :user_cards

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :github, presence: true
  validates :avatar, presence: true
  validates :batch_date, presence: true
  validates :batch, presence: true
  validates :city, presence: true
  validates :status, presence: true
end
