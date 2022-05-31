class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :first_name
      t.string :last_name
      t.string :github
      t.text :avatar
      t.string :batch_date
      t.string :batch
      t.string :city
      t.string :status

      t.timestamps
    end
  end
end
