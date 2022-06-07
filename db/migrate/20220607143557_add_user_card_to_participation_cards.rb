class AddUserCardToParticipationCards < ActiveRecord::Migration[6.1]
  def change
    add_reference :participation_cards, :user_card, foreign_key: true
  end
end
