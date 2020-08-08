require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get login_path
      expect(response).to have_http_status(:success)
      expect(response.body).to match('Login')
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      user0 = User.new(name: 'User0', email: 'user0@example.com', password: 'foobar')
      user0.save
      session = { session: { email: 'user0@example.com', password: 'foobar' } }
      post sessions_new_path(session)
      expect(response).to have_http_status(:found)
      flash[:notice].should_not be_nil
      response.should redirect_to(root_url)
    end

    it 'returns false if email does not exists in database' do
      user0 = User.new(name: 'User0', email: 'user0@example.com', password: 'foobar')
      user0.save
      session = { session: { email: 'user1@example.com', password: 'foobar' } }
      post sessions_new_path(session)
      expect(response).to have_http_status(:success)
      flash[:danger].should_not be_nil
      response.should render_template('new')
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get logout_path
      expect(response).to have_http_status(:found)
      flash[:notice].should_not be_nil
      response.should redirect_to(root_url)
    end
  end
end
