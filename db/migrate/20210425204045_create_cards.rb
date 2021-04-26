class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :text
      t.integer :power
      t.integer :toughness
      t.integer :cmc
      t.string :card_type
      t.string :colors
      t.string :set
      t.string :mana_cost
      t.string :image_url

      t.timestamps
    end
  end
end
