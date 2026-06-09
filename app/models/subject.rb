class Subject < ApplicationRecord
  has_many :lessons, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 0 }
end
