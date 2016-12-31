# frozen_string_literal: true
# User controller
class UsersController < ApplicationController
  # Filter to set user
  before_action :set_user, only: [:destroy]
  # To create a new user
  # Request Params : first_name, last_name, email(required), password(required)
  # Result: New user will be added
  def create
    user = User.new(user_params)
    if user.save
      render json: { status: :success, data: user.to_json }, status: :ok
    else
      render json: { status: :error, data: user.errors }, status: :unprocessable_entity
    end
  end

  # To archive the user
  # Request Params : id
  # Result: New user will be added
  def destroy
    @user.destroy
    render json: { status: :success }, status: :created
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def set_user
    @user = User.where('id =?', params[:id]).first
    render json: { status: :error, data: { error: 'User not found' } }, status: :unprocessable_entity unless @user.present?
  end
end
