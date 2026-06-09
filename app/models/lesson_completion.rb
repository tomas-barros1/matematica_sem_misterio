class LessonCompletion < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :completed_at, presence: true
  validates :lesson_id, uniqueness: { scope: :user_id }
end
