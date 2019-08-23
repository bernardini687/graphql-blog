class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :street, null: false
      t.string :number, null: false
      t.string :city, null: false
      t.string :postcode, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
