require "rails_helper"

RSpec.describe "Lesson completion", type: :system do
  it "finishes a lesson, grants xp, and shows the answer correction" do
    subject_model = create(:subject, name: "Matemática")
    lesson = create(:lesson, subject: subject_model)
    question = create(:question, lesson: lesson, statement: "Quanto é 2 + 2?", option_a: "3", option_b: "4", option_c: "5", option_d: "6", correct_answer: "b")
    user = create(:user, password: "Password1!", password_confirmation: "Password1!")

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Senha", with: "Password1!"
    click_button "Entrar"

    visit lesson_path(lesson)
    choose "4"
    click_button "Finalizar lição"

    expect(page).to have_text("Você ganhou")
    expect(page).to have_text("Correção da sua tentativa")
    expect(page).to have_text("Você acertou")
    expect(page).to have_text("Sua resposta: 4")
    expect(user.reload.xp).to be > 0
    expect(user.lesson_completions.count).to eq(1)
  end

  it "shows the correct answer for a missed question" do
    subject_model = create(:subject, name: "Matemática")
    lesson = create(:lesson, subject: subject_model)
    create(:question, lesson: lesson, statement: "Quanto é 2 + 2?", option_a: "3", option_b: "4", option_c: "5", option_d: "6", correct_answer: "b")
    user = create(:user, password: "Password1!", password_confirmation: "Password1!")

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Senha", with: "Password1!"
    click_button "Entrar"

    visit lesson_path(lesson)
    choose "3"
    click_button "Finalizar lição"

    expect(page).to have_text("Você errou")
    expect(page).to have_text("Sua resposta: 3")
    expect(page).to have_text("Resposta correta: 4")
  end
end
