class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,      null: false
      t.integer :origin_area_id,  null: false
      t.string :prefecture,       null: false
      t.string :home_number,      null: false
      t.string :building_number
      t.string :telephone,        null: false
      t.references :order,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
