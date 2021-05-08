class AddCollectionIdToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :collection_id, :integer
  end
end
