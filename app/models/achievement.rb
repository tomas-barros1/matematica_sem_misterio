class Achievement < ApplicationRecord
  has_many :user_achievements, dependent: :destroy
  has_many :users, through: :user_achievements

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :xp_requirement, numericality: { greater_than_or_equal_to: 0 }
  validates :code, presence: true, uniqueness: { case_sensitive: false }
end
