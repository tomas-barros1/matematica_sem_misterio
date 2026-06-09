class UserAchievement < ApplicationRecord
  belongs_to :user
  belongs_to :achievement

  validates :unlocked_at, presence: true
  validates :achievement_id, uniqueness: { scope: :user_id }
end
