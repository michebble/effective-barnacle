class JobsPlumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs_plumbers, id: false do |t|
      t.belongs_to :plumber
      t.belongs_to :job, type: :uuid
    end
  end
end
