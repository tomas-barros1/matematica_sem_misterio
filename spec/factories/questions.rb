FactoryBot.define do
  factory :question do
    association :lesson
    kind { :multiple_choice }
    statement { "Quanto é 2 + 2?" }
    option_a { "3" }
    option_b { "4" }
    option_c { "5" }
    option_d { "6" }
    correct_answer { "b" }
    explanation { "2 + 2 = 4." }
    position { 0 }

    trait :true_false do
      kind { :true_false }
      option_a { nil }
      option_b { nil }
      option_c { nil }
      option_d { nil }
      correct_answer { "true" }
    end
  end
end
