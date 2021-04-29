class CreateCardLegality < ActiveRecord::Migration[6.1]
  def change
    create_table :card_legalities do |t|
      t.belongs_to :card, index: true
      t.belongs_to :format, index: true
      t.boolean :legal, default: true
      t.timestamps
    end
  end
end
