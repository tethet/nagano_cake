class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id,         null: false
      t.string  :name,             null: false
      t.text    :explanation,      null: false
      t.integer :price_without_tax,null: false
      t.boolean :item_status,      null: false, default: false

      t.timestamps
    end
  end
end
