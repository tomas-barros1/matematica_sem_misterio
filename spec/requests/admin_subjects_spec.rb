require "rails_helper"

RSpec.describe "Admin subjects", type: :request do
  it "prevents students from accessing admin pages" do
    sign_in create(:user)

    get admin_subjects_path

    expect(response).to redirect_to(root_path)
  end

  it "allows admins to create a subject" do
    sign_in create(:user, :admin)

    post admin_subjects_path, params: { subject: { name: "Nova disciplina", description: "Descrição", position: 1 } }

    expect(response).to redirect_to(admin_subjects_path)
    expect(Subject.exists?(name: "Nova disciplina")).to be(true)
  end
end
