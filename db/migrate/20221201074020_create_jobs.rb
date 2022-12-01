class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs, id: :uuid do |t|
      t.references :client, null: false, foreign_key: true, type: :uuid
      t.date :start_on, null: false
      t.datetime :done_at

      t.timestamps
    end
  end
end
