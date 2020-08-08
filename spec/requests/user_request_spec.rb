require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get new_user_path
      expect(response).to have_http_status(:success)
      expect(response.body).to match('Inscrever-se')
    end

    it "returns http success" do
      user = ({user: {name: 'User', email: 'user@example.com', password: 'foobar', password_confirmation: 'foobar'}})
      post users_new_path(user)
      expect(response).to have_http_status(:found)
      flash[:success].should_not be_nil
      expect(session[:user_id]).to be_truthy
      response.should redirect_to(root_url)
    end

    it "renders new" do
      user = ({user: {name: 'User', email: 'user@example.com'}})
      post users_new_path(user)
      expect(response).to have_http_status(:success)
      response.should render_template('new')
    end
  end
end
