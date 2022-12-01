class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.text :private_note

      t.timestamps
    end
  end
end
