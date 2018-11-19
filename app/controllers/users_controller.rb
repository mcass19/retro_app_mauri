# frozen_string_literal: true

# :nodoc:
class UsersController < ApplicationController
  # POST /users
  def create
    @user = User.create!(user_params)
  end

  private

  def user_params
    params.require(:user)
          .permit(:username, :email, :password, :profile_img)
  end
end
