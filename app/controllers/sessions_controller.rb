class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:Session][:password])
      # Sign the user in and redirect to the user's show page.
    else
      flash[:error] = 'Invalid eamil/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end
end