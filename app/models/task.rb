class Task < ApplicationRecord
  validates :title, :status, :due, :description, presence: true

  enum :status, { "In progress": 0, "Completed": 1 }
end
