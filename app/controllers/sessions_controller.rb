class SessionsController < ApplicationController

  # GET /login
  def new
    #if logged_in?
      #@user = current_user
      #render 'users/show'
    #end
    #@session = Session.new
  end

  # POST /login
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Success
      log_in user
      flash[:newlogin] = 'ログインしました'
      redirect_back_or user
    else
      # Failure
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # DELETE /logout
  def destroy
    log_out
    redirect_to root_url
  end
end