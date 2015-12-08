class AdminSessionsController < ApplicationController

  def new
  end

  def create
    adminUser = AdminUser.find_by(email: params[:session][:email].downcase)
    if adminUser && adminUser.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      admin_log_in adminUser
#      redirect_to adminUser
      redirect_to admin_user_manage_path(adminUser.id)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    admin_log_out
    redirect_to root_url
  end

end
