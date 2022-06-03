class Points < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :points, :integer
  end
end
