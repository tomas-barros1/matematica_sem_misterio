FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Aluno #{n}" }
    sequence(:email) { |n| "aluno#{n}@example.com" }
    password { "Password1!" }
    password_confirmation { "Password1!" }
    role { :student }

    trait :admin do
      role { :admin }
      sequence(:email) { |n| "admin#{n}@example.com" }
      sequence(:name) { |n| "Administrador #{n}" }
    end
  end
end
