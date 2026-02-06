class UsersController < ApplicationController
  allow_unauthenticated_access only: [ :new, :create ]
  def new
    @user = User.new
    render "registrations/new", layout: "session"
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      start_new_session_for(@user)
      redirect_to home_path, notice: "Account created successfully. Welcome!"
    else
      render "registrations/new", layout: "session", status: :unprocessable_entity
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end