# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # valdating user based on token
  def validate_user
    token = params['X-Api-Key'] || request.headers['X-Api-Key']
    render json: { status: :error, data: 'Api Key is required' } unless token
    @user = User.find_by token: token
    render json: { status: :error, data: 'Invalid Api Key' } unless user
  end

  # Access currently logged in uset
  def current_user
    @user
  end
end
