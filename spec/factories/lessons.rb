FactoryBot.define do
  factory :lesson do
    association :subject
    sequence(:title) { |n| "Lição #{n}" }
    description { "Descrição da lição." }
    position { 0 }
    xp_reward { 50 }
    active { true }
  end
end
