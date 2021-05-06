class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.integer :card_id
      t.string :count

      t.timestamps
    end
  end
end
