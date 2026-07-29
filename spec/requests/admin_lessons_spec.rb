require "rails_helper"

RSpec.describe "Admin lessons", type: :request do
  it "allows an admin to create a lesson" do
    admin = create(:user, :admin)
    subject = create(:subject)

    sign_in admin

    post admin_lessons_path, params: {
      lesson: {
        subject_id: subject.id,
        title: "Frações iniciais",
        description: "Entenda as partes de um todo.",
        position: 1,
        xp_reward: 50,
        active: true
      }
    }

    expect(response).to redirect_to(admin_lessons_path)
    expect(Lesson.exists?(title: "Frações iniciais", subject: subject)).to be(true)
  end

  it "prevents a student from creating a lesson" do
    sign_in create(:user)

    post admin_lessons_path, params: { lesson: { title: "Sem permissão" } }

    expect(response).to redirect_to(root_path)
    expect(Lesson.exists?(title: "Sem permissão")).to be(false)
  end

  it "shows a lesson's questions and starts a new question linked to that lesson" do
    admin = create(:user, :admin)
    lesson = create(:lesson)
    question = create(:question, lesson: lesson)

    sign_in admin

    get admin_lesson_path(lesson)

    expect(response.body).to include(question.statement)
    expect(response.body).to include(new_admin_question_path(lesson_id: lesson.id))

    get new_admin_question_path(lesson_id: lesson.id)

    expect(response.body).to include("value=\"#{lesson.id}\"")
  end
end
