class Card < ApplicationRecord
  has_many :user_cards

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :github, presence: true, uniqueness: true
  validates :avatar, presence: true
  validates :batch_date, presence: true
  validates :batch, presence: true
  validates :city, presence: true
  validates :status, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_card_characteristic,
    against: [ :first_name, :last_name, :github, :batch_date, :batch, :city, :status ],
    using: {
      tsearch: { prefix: true }
    }
end
