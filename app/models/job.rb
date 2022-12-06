class Job < ApplicationRecord
  belongs_to :client
  has_and_belongs_to_many :plumbers, class_name: "Plumber"

  scope :by_period, ->(start_on_from, start_on_to) { where(start_on: start_on_from.to_date..start_on_to.to_date) }

  validates :start_on, presence: true
  validates :client, presence: true
  validates :plumbers, presence: true

  def mark_as_done
    if done_at.nil?
      update(done_at: Time.current)
    end
  end
end
