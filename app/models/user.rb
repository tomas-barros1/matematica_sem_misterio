class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum :role, { student: 0, admin: 1 }, default: :student

  has_many :lesson_completions, dependent: :destroy
  has_many :user_achievements, dependent: :destroy
  has_many :achievements, through: :user_achievements

  validates :name, presence: true
  validates :xp, numericality: { greater_than_or_equal_to: 0 }
  validates :level, numericality: { greater_than_or_equal_to: 1 }
  validates :streak, numericality: { greater_than_or_equal_to: 0 }

  before_validation :sync_level_with_xp

  def display_name
    name.presence || email.split("@").first.titleize
  end

  def level_progress
    Gamification::LevelCalculator.progress_for(xp)
  end

  private

  def sync_level_with_xp
    self.level = Gamification::LevelCalculator.level_for(xp || 0)
  end
end
