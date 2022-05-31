class CreateRoundCards < ActiveRecord::Migration[6.1]
  def change
    create_table :round_cards do |t|
      t.string :progress
      t.references :round, null: false, foreign_key: true
      t.references :participation_card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
