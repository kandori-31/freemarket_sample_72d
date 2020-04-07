class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postalcode, null: false
      t.string :prefecture, null: false
      t.string :first_address, null: false
      t.string :second_address, null: false
      t.string :third_address
      t.timestamps
    end
  end
end
