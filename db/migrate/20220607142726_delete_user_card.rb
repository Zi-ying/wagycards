class DeleteUserCard < ActiveRecord::Migration[6.1]
  def change
    remove_column :participation_cards, :user_card_id
  end
end
