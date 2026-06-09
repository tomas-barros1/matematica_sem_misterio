FactoryBot.define do
  factory :lesson_completion do
    user
    lesson
    score { 100 }
    completed_at { Time.current }
  end
end
