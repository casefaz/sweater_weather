class Api::V1::SessionsController < ApplicationController
  def create
    # binding.pry
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else 
      render json: {error: user.errors.full_messages.to_sentence}, status: 400
    end
  end
end