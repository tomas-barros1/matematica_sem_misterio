require "rails_helper"

RSpec.describe "Authentication", type: :request do
  it "redirects guests from dashboard" do
    get dashboard_path

    expect(response).to redirect_to(new_user_session_path)
  end

  it "allows a signed in user to reach dashboard" do
    sign_in create(:user)

    get dashboard_path

    expect(response).to have_http_status(:ok)
  end
end
