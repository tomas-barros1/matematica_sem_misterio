require_relative "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit root_url

    assert_selector "h1", text: "Aprenda testando."
    assert_selector "a", text: "Começar gratuitamente"
    assert_selector "a", text: "Ver como funciona"
  end

  test "home page shows how it works section" do
    visit root_url

    assert_text "Escolha uma missão"
    assert_text "Teste sua ideia"
    assert_text "Veja o porquê"
  end

  test "home page CTA links to registration for guests" do
    visit root_url

    click_on "Começar gratuitamente"

    assert_current_path new_user_registration_path
  end
end
