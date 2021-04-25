class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :text
      t.integer :power
      t.integer :toughness
      t.integer :cmc
      t.string :type
      t.string :colors
      t.string :set
      t.string :mana_cost
      t.string :image_url
      t.belongs_to :deck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
