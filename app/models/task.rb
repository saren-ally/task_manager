class Task < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true

  enum :status, { in_progress: 0, completed: 1 }
end
