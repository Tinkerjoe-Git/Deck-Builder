class CreateDecklists < ActiveRecord::Migration[6.1]
  def change
    create_table :decklists do |t|
      t.string :card_id
      t.string :deck_id
      t.string :quantities
      t.string :card_types

      t.timestamps
    end
  end
end
