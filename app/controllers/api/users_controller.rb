class Api::UsersController < ApplicationController

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    user.save
      render json: user.as_json
  end
end
