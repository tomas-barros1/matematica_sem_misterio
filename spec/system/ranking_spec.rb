require "rails_helper"

RSpec.describe "Ranking", type: :system do
  it "shows users ordered by xp" do
    create(:user, name: "Primeiro", xp: 500, level: 4, password: "Password1!", password_confirmation: "Password1!")
    create(:user, name: "Segundo", xp: 200, level: 2, password: "Password1!", password_confirmation: "Password1!")
    user = create(:user, password: "Password1!", password_confirmation: "Password1!")

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Senha", with: "Password1!"
    click_button "Entrar"

    visit ranking_index_path

    expect(page).to have_text("Primeiro")
    expect(page).to have_text("Segundo")
  end
end
