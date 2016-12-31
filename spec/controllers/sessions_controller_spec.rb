# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  valid_attributes = {
    email: 'xyz@xyz.com',
    password: 'password'
  }
  invalid_attributes = {
    email: 'xyz@xyz.com',
    password: 'passwords'
  }
  # Spec for new user session
  describe 'Create new session' do
    context 'with valid params' do
      it 'creates a new session' do
        User.create(first_name: 'fname', email: 'xyz@xyz.com', password: 'password')
        post :create, params: { user: valid_attributes, format: 'json' }
        JSON.parse(response.body)['status'] == 'success'
      end
    end
    context 'with invalid params' do
      it 'not creates a new session' do
        User.create(first_name: 'fname', email: 'xyz@xyz.com', password: 'password')
        post :create, params: { user: invalid_attributes, format: 'json' }
        JSON.parse(response.body)['status'] == 'error'
      end
    end
  end
end
