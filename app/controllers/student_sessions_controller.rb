class StudentSessionsController < ApplicationController
  def new
  end

#  def create
# check if valid code matches given one
# create new studentUser object (from valid code options)
#    if studentUser
      # Log the user in and redirect to the user's show page.
#      student_log_in studentUser
#      redirect_to studentUser
#    else
#      flash.now[:danger] = 'Invalid code'
#      render 'new'
#    end
#  end

  def destroy
    student_log_out
    redirect_to root_url
  end

end
