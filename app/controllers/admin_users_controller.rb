class AdminUsersController < ApplicationController
 before_action :logged_in_admin_user, only: [:show, :manage]

  def queries
    getAllQueryData
  end

  def manage
    if session[:admin_user_id] != params[:id].to_i
      if current_admin_user
        redirect_to current_admin_user
      else
        redirect_to admin_login_path
      end
    else
      @admin_user = AdminUser.find(params[:id])
    end
  end

  def show
    if session[:admin_user_id] != params[:id].to_i
      redirect_to current_admin_user
    else
      @admin_user = AdminUser.find(params[:id])
    end
  end

  def new
    @admin_user = AdminUser.new
  end

#  private

#    def admin_user_params
#      params.require(:user).permit(:name, :email, :password,
#                                   :password_confirmation)
#    end

end
