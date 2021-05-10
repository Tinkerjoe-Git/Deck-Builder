class AddQuantityToDeckCards < ActiveRecord::Migration[6.1]
  def change
    add_column :deck_cards, :quantity, :integer
  end
end
