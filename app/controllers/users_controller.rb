# frozen_string_literal: true
# User controller
class UsersController < ApplicationController
  # To create a new user
  # Request Params : first_name, last_name, email(required), password(required)
  # Result: New user will be added
  def create
    user = User.new(user_params)
    if user.save
      render json: { status: :success, data: user.to_json }, status: :created
    else
      render json: { status: :error, data: user.errors }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
