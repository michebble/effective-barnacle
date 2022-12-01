class Job < ApplicationRecord
  belongs_to :client
  has_and_belongs_to_many :plumbers, class_name: "Plumber"
end
