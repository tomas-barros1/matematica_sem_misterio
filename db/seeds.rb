LessonCompletion.delete_all
UserAchievement.delete_all
Question.delete_all
Lesson.delete_all
Subject.delete_all
Achievement.delete_all
User.delete_all

def create_question(lesson, statement, options, correct_answer, explanation, position)
  lesson.questions.create!(
    kind: :multiple_choice,
    statement: statement,
    option_a: options[0],
    option_b: options[1],
    option_c: options[2],
    option_d: options[3],
    correct_answer: correct_answer,
    explanation: explanation,
    position: position
  )
end

admin = User.create!(name: "Admin", email: "admin@example.com", password: "Password1!", password_confirmation: "Password1!", role: :admin)
student = User.create!(name: "Estudante", email: "estudante@example.com", password: "Password1!", password_confirmation: "Password1!", role: :student)

[
  { code: "first-lesson", name: "Primeira Lição", description: "Conclua sua primeira lição de matemática.", xp_requirement: 50 },
  { code: "hundred-xp", name: "100 XP", description: "Chegue a 100 XP.", xp_requirement: 100 },
  { code: "five-hundred-xp", name: "500 XP", description: "Chegue a 500 XP.", xp_requirement: 500 },
  { code: "thousand-xp", name: "1000 XP", description: "Chegue a 1000 XP.", xp_requirement: 1000 },
  { code: "seven-day-streak", name: "7 Dias Seguidos", description: "Estude por 7 dias consecutivos.", xp_requirement: 0, streak_requirement: 7 }
].each { |attrs| Achievement.create!(attrs) }

subject = Subject.create!(name: "Matemática", description: "Desafios de cálculo, lógica e números.", position: 0)

lessons = [
  {
    title: "Adição até 10",
    description: "Some números pequenos e ganhe confiança.",
    questions: [
      [ "Quanto é 1 + 2?", [ "2", "3", "4", "5" ], "b", "1 + 2 = 3." ],
      [ "Quanto é 2 + 3?", [ "4", "5", "6", "7" ], "b", "2 + 3 = 5." ],
      [ "Quanto é 4 + 1?", [ "3", "4", "5", "6" ], "c", "4 + 1 = 5." ],
      [ "Quanto é 5 + 2?", [ "6", "7", "8", "9" ], "b", "5 + 2 = 7." ],
      [ "Quanto é 3 + 6?", [ "7", "8", "9", "10" ], "c", "3 + 6 = 9." ],
      [ "Quanto é 7 + 2?", [ "8", "9", "10", "11" ], "b", "7 + 2 = 9." ],
      [ "Quanto é 8 + 1?", [ "8", "9", "10", "11" ], "b", "8 + 1 = 9." ],
      [ "Quanto é 6 + 4?", [ "8", "9", "10", "11" ], "c", "6 + 4 = 10." ],
      [ "Quanto é 9 + 0?", [ "7", "8", "9", "10" ], "c", "Somar zero não altera o número." ],
      [ "Quanto é 2 + 7?", [ "8", "9", "10", "11" ], "b", "2 + 7 = 9." ]
    ]
  },
  {
    title: "Subtração até 20",
    description: "Treine subtrações com apoio visual.",
    questions: [
      [ "Quanto é 10 - 3?", [ "5", "6", "7", "8" ], "c", "10 - 3 = 7." ],
      [ "Quanto é 15 - 5?", [ "8", "9", "10", "11" ], "c", "15 - 5 = 10." ],
      [ "Quanto é 12 - 4?", [ "6", "7", "8", "9" ], "b", "12 - 4 = 8." ],
      [ "Quanto é 18 - 6?", [ "10", "11", "12", "13" ], "c", "18 - 6 = 12." ],
      [ "Quanto é 20 - 8?", [ "10", "11", "12", "13" ], "c", "20 - 8 = 12." ],
      [ "Quanto é 14 - 2?", [ "10", "11", "12", "13" ], "c", "14 - 2 = 12." ],
      [ "Quanto é 16 - 7?", [ "7", "8", "9", "10" ], "b", "16 - 7 = 9." ],
      [ "Quanto é 13 - 5?", [ "6", "7", "8", "9" ], "c", "13 - 5 = 8." ],
      [ "Quanto é 19 - 9?", [ "8", "9", "10", "11" ], "c", "19 - 9 = 10." ],
      [ "Quanto é 17 - 8?", [ "7", "8", "9", "10" ], "c", "17 - 8 = 9." ]
    ]
  },
  {
    title: "Tabuada do 2",
    description: "Memorize a tabuada do 2.",
    questions: [
      [ "Quanto é 2 × 1?", [ "1", "2", "3", "4" ], "b", "2 × 1 = 2." ],
      [ "Quanto é 2 × 3?", [ "4", "5", "6", "7" ], "c", "2 × 3 = 6." ],
      [ "Quanto é 2 × 4?", [ "6", "7", "8", "9" ], "c", "2 × 4 = 8." ],
      [ "Quanto é 2 × 5?", [ "8", "9", "10", "11" ], "c", "2 × 5 = 10." ],
      [ "Quanto é 2 × 6?", [ "10", "11", "12", "13" ], "c", "2 × 6 = 12." ],
      [ "Quanto é 2 × 7?", [ "12", "13", "14", "15" ], "c", "2 × 7 = 14." ],
      [ "Quanto é 2 × 8?", [ "14", "15", "16", "17" ], "c", "2 × 8 = 16." ],
      [ "Quanto é 2 × 9?", [ "16", "17", "18", "19" ], "c", "2 × 9 = 18." ],
      [ "Quanto é 2 × 10?", [ "18", "19", "20", "21" ], "c", "2 × 10 = 20." ],
      [ "Quanto é 2 × 2?", [ "2", "3", "4", "5" ], "c", "2 × 2 = 4." ]
    ]
  },
  {
    title: "Divisão simples",
    description: "Divida em partes iguais.",
    questions: [
      [ "Quanto é 6 ÷ 2?", [ "2", "3", "4", "5" ], "b", "6 ÷ 2 = 3." ],
      [ "Quanto é 8 ÷ 4?", [ "1", "2", "3", "4" ], "b", "8 ÷ 4 = 2." ],
      [ "Quanto é 10 ÷ 5?", [ "1", "2", "3", "4" ], "b", "10 ÷ 5 = 2." ],
      [ "Quanto é 12 ÷ 3?", [ "2", "3", "4", "5" ], "c", "12 ÷ 3 = 4." ],
      [ "Quanto é 14 ÷ 7?", [ "1", "2", "3", "4" ], "b", "14 ÷ 7 = 2." ],
      [ "Quanto é 16 ÷ 2?", [ "6", "7", "8", "9" ], "c", "16 ÷ 2 = 8." ],
      [ "Quanto é 18 ÷ 6?", [ "2", "3", "4", "5" ], "b", "18 ÷ 6 = 3." ],
      [ "Quanto é 20 ÷ 4?", [ "4", "5", "6", "7" ], "b", "20 ÷ 4 = 5." ],
      [ "Quanto é 9 ÷ 3?", [ "1", "2", "3", "4" ], "c", "9 ÷ 3 = 3." ],
      [ "Quanto é 15 ÷ 5?", [ "1", "2", "3", "4" ], "b", "15 ÷ 5 = 3." ]
    ]
  },
  {
    title: "Figuras geométricas",
    description: "Reconheça formas básicas.",
    questions: [
      [ "Quantos lados tem um triângulo?", [ "2", "3", "4", "5" ], "b", "Triângulo tem 3 lados." ],
      [ "Quantos lados tem um quadrado?", [ "3", "4", "5", "6" ], "b", "Quadrado tem 4 lados." ],
      [ "Qual figura é redonda?", [ "Triângulo", "Quadrado", "Círculo", "Retângulo" ], "c", "O círculo é redondo." ],
      [ "Quantos lados tem um retângulo?", [ "3", "4", "5", "6" ], "b", "Retângulo tem 4 lados." ],
      [ "Qual figura tem 6 lados?", [ "Pentágono", "Hexágono", "Triângulo", "Círculo" ], "b", "Hexágono tem 6 lados." ],
      [ "Quantos vértices tem um quadrado?", [ "2", "3", "4", "5" ], "c", "Quadrado tem 4 vértices." ],
      [ "Qual figura tem 5 lados?", [ "Quadrado", "Pentágono", "Hexágono", "Triângulo" ], "b", "Pentágono tem 5 lados." ],
      [ "Qual figura tem 8 lados?", [ "Hexágono", "Octógono", "Triângulo", "Círculo" ], "b", "Octógono tem 8 lados." ],
      [ "Um cubo tem faces...", [ "planas", "redondas", "pontudas", "sem forma" ], "a", "O cubo tem faces planas." ],
      [ "Qual figura lembra uma bola?", [ "Círculo", "Quadrado", "Triângulo", "Retângulo" ], "a", "A bola lembra um círculo." ]
    ]
  }
]

lessons.each_with_index do |lesson_data, lesson_index|
  lesson = subject.lessons.create!(
    title: lesson_data[:title],
    description: lesson_data[:description],
    position: lesson_index + 1,
    xp_reward: 50,
    active: true
  )

  lesson_data[:questions].each_with_index do |(statement, options, correct_answer, explanation), question_index|
    create_question(lesson, statement, options, correct_answer, explanation, question_index)
  end
end

student.update!(xp: 160, streak: 3, last_study_at: 1.day.ago)

LessonCompletion.create!(
  user: student,
  lesson: Lesson.first,
  score: 100,
  completed_at: 1.day.ago
)

UserAchievement.create!(
  user: student,
  achievement: Achievement.find_by!(code: "first-lesson"),
  unlocked_at: 1.day.ago
)
