class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user,       null: false, foreign_key: true
      t.string :name,           null: false
      t.text :content,          null: false
      t.integer :price,         null: false
      t.integer :category_id,   null: false
      t.integer :state_id,      null: false
      t.integer :delivery_fee_id,  null: false
      t.integer :area_id,       null: false
      t.integer :delivery_day_id,  null: false
      t.timestamps
    end
  end
end
