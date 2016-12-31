# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  valid_attributes = {
    format: 'json',
    user: {
      first_name: 'fname',
      email: 'xyz@xyz.com',
      password: 'password'
    }
  }
  invalid_attributes = {
    format: 'json',
    user: {
      first_name: 'fname',
      password: 'password'
    }
  }
  # Spec for users signup
  describe 'Create user' do
    context 'with valid params' do
      it 'creates a new user' do
        post :create, params: valid_attributes
        expect(response).to be_success
      end
    end
    context 'with invalid params' do
      it 'not creates a new user' do
        post :create, params: invalid_attributes
        expect(response).to_not be_success
      end
    end
  end
end
