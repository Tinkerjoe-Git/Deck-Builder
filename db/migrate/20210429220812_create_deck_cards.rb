class CreateDeckCards < ActiveRecord::Migration[6.1]
  def change
    create_table :deck_cards do |t|
      t.integer :deck_id
      t.index :deck_id
      t.belongs_to :card, index: true

      t.timestamps
    end
  end
end
