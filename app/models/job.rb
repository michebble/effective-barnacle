class Job < ApplicationRecord
  belongs_to :client
  has_and_belongs_to_many :plumbers, class_name: "Plumber"

  def mark_as_done
    if done_at.nil?
      update(done_at: Time.current)
    end
  end
end
