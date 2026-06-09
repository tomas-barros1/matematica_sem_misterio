FactoryBot.define do
  factory :achievement do
    sequence(:code) { |n| "achievement-#{n}" }
    sequence(:name) { |n| "Conquista #{n}" }
    description { "Descrição da conquista." }
    xp_requirement { 100 }
    streak_requirement { nil }
    lesson_completion_requirement { nil }
  end
end
