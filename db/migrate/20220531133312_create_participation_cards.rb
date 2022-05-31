class CreateParticipationCards < ActiveRecord::Migration[6.1]
  def change
    create_table :participation_cards do |t|
      t.references :participation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
