class Lesson < ApplicationRecord
  belongs_to :subject

  has_many :questions, -> { order(:position) }, dependent: :destroy
  has_many :lesson_completions, dependent: :destroy
  has_many :completed_users, through: :lesson_completions, source: :user

  validates :title, presence: true
  validates :description, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }
  validates :xp_reward, numericality: { greater_than_or_equal_to: 0 }
  validates :subject, presence: true

  scope :active, -> { where(active: true) }
end
