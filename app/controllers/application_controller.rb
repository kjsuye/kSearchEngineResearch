class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include AdminSessionsHelper
  include StudentSessionsHelper
  include SearchHelper
  include QueriesHelper

  def logged_in_admin_user
    unless admin_logged_in?
      flash[:danger] = "Please log in."
      redirect_to admin_login_path
    end
  end

  def logged_in_student_user
    unless student_logged_in? or admin_logged_in?
      flash[:danger] = "Please log in."
      redirect_to student_signup_path
    end
  end

end
