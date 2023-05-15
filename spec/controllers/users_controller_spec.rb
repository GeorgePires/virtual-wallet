# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) { FactoryBot.attributes_for(:user) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:user, name: nil, email: nil) }

  describe 'GET #index' do
    context 'no user logged in' do
      it '1: should return 302 and redirect to /admins/sign_in' do
        get :index
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(admin_session_path)
      end
    end

    context 'with admin logged' do
      login_admin
      it '2: should returns 200 (success)' do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET #new' do
    context 'with admin logged' do
      login_admin
      it 'should returns 200 (success)' do
        get :new
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET #show' do
    login_admin
    it '1: should returns 200 (success)' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
    end

    it '2: should show user' do
      get :show, params: { id: user.id }
      expect(controller.instance_variable_get(:@user)).to eq(user)
    end

    it "3: should shows the user's wallet" do
      get :show, params: { id: user.id }
      expect(controller.instance_variable_get(:@wallet)).to eq(user.wallet)
    end

    it "4: should shows the user's transactions" do
      transactions = user.wallet.transactions.limit(8).order(created_at: :desc)
      get :show, params: { id: user.id }
      expect(controller.instance_variable_get(:@transactions)).to eq(transactions)
    end
  end

  describe 'GET #edit' do
    login_admin
    it 'should returns 200 (success)' do
      get :edit, params: { id: user.to_param }
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      login_admin
      it '1: creates a new User' do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it '2: redirects to the created user' do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(user_path(User.last))
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:name) { { name: 'New Name' } }
      it '1: updates the requested user' do
        put :update, params: { id: user.id, user: name }
        user.reload
        expect(user.name).to eq('New Name')
      end

      login_admin
      it '2: redirects to the user' do
        put :update, params: { id: user.id, user: name }
        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid params' do
      login_admin
      it 'returns http unprocessable_entity' do
        put :update, params: { id: user.id, user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    login_admin
    user = FactoryBot.create(:user)
    it '1: destroys the requested user' do
      expect { delete :destroy, params: { id: user.id } }.to change(User, :count).by(-1)
    end

    it '2: redirects to the users list' do
      delete :destroy, params: { id: user.to_param }
      expect(response).to redirect_to(users_url)
    end
  end
end
