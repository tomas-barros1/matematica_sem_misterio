FactoryBot.define do
  factory :subject do
    sequence(:name) { |n| "Disciplina #{n}" }
    description { "Descrição da disciplina." }
    position { 0 }
  end
end
