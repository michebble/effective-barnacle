class CreatePlumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :plumbers do |t|
      t.string :name, null: false
      t.string :street
      t.string :city
      t.string :state
      t.string :postal_code
      t.text :vehicles, array: true, default: []

      t.timestamps
    end
  end
end
