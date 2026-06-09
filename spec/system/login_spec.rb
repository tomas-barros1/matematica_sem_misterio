require "rails_helper"

RSpec.describe "Login", type: :system do
  it "logs the user in" do
    user = create(:user, password: "Password1!", password_confirmation: "Password1!")

    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Senha", with: "Password1!"
    click_button "Entrar"

    expect(page).to have_current_path(dashboard_path, ignore_query: true)
    expect(page).to have_text("Painel")
  end
end
