class UsersController < ApplicationController
  skip_before_action :authenticate
  def sign_up
  end

  def sign_up!
    user = User.new(
      username: params[:username],
      password_digest: BCrypt::Password.create(params[:password])
    )
    if params[:password_confirmation] != params[:password]
      flash[:notice] = "Your passwords don't match!"
    elsif user.save
      flash[:notice]= "Your account has been created!"
    else
      flash[:notice]= "Your account couldn't be created. Did you enter a unique username and password?"
    end
    redirect_to action: :sign_up
  end

  def sign_in
  end

  def sign_in!
    @user = User.find_by(username: params[:username])
    if !@user
      flash[:notice] = "This user doesn't exist!"
    elsif !BCrypt::Password.new(@user.password_digest).is_password?(params[:password])
      flash[:notice] = "Your password's wrong!"
    else
      flash[:notice] = "You're signed in, #{@user.username}! "
        cookies[:username] = {
          value: @user.username,
          expires: 100.years.from_now
        }
        session[:user] = @user
      end
      redirect_to action: :sign_in
    end


  def sign_out
    flash[:notice] = "You're signed out!"
    redirect_to root_url
    reset_session
  end

end
