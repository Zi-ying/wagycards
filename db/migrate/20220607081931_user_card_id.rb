class UserCardId < ActiveRecord::Migration[6.1]
  def change
    add_column :participation_cards, :user_card_id, :string
  end
end
