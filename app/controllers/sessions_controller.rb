class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
    # could be written as
    # if user&.authenticate(params[:session][:password]) 
    # user&. is same as user && user.blahblah
      reset_session
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      log_in @user
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Uses flash.now instead of flash[:danger] to get rid of persistance problem
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
  
end
