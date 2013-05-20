class SessionsController < ApplicationController
  before_filter :already_login, :only => [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid eamil/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private

    def already_login
      redirect_to root_url, :notice => "Already login." if signed_in?
    end
end