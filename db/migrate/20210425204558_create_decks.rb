class CreateDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :decklist
      t.integer :user_id
      t.resources :user
      t.resources :card
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
