class Task < ApplicationRecord
  validates :title, :status, :due, :description, presence: true

  enum :status, { in_progress: 0, completed: 1 }
end
