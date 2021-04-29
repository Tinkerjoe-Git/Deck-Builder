class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.belongs_to :user, index: true
      t.belongs_to :card, index: true
      t.belongs_to :magic_set, index: true
      t.integer :count
      t.boolean :wishlist, default: false
      t.timestamps
    end
  end
end
