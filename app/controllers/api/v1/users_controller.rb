class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      render json: { status: :bad_request }
    end
    # binding.pry
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end