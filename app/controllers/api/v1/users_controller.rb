class Api::V1::UsersController < ApplicationController
  def create
    # binding.pry
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: 400
    # binding.pry
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end