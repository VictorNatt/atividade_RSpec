require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "authorization" do
    controller do
      def index
        raise Pundit::NotAuthorizedError
      end
    end

    it "redirects unauthorized access" do
      routes.draw { get "index" => "anonymous#index" }
      get :index
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq("Você não tem permissão para realizar essa ação.")
    end
  end
end