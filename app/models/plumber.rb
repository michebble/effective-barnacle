class Plumber < ApplicationRecord
  has_and_belongs_to_many :jobs, class_name: "Job"
end
