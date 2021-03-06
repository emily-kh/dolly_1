class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :category_id, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
