require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/sign_in" do
    it "renders the sign in page" do
      get new_user_session_path
      expect(response).to have_http_status(:ok)
    end
  end
end