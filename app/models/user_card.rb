class UserCard < ApplicationRecord
  belongs_to :user
  belongs_to :card
  has_many :participation_cards

  include PgSearch::Model
  pg_search_scope :search_by_card_characteristic,
    against: [ :first_name, :last_name, :github, :batch_date, :batch, :city, :status ],
    using: {
    tsearch: { prefix: true }
  }
end
