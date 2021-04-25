class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.resources :user
      t.resources :deck
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
