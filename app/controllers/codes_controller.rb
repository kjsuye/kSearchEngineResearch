class CodesController < ApplicationController
 
  def show
    @code = Code.find(params[:id])
  end
 
  def new
    @code = Code.new
  end
 
  def create
    @code = Code.new(code_params)
 
    if @code.save
      redirect_to admin_user_manage_path(current_admin_user.id)
    else
      render 'new'
    end
  end

#  def update
#    @code = Code.find(params[:id])
 
#    if @code.update(article_params)
#      redirect_to user_session
#    else
#      render 'edit'
#    end
#  end
 
  def destroy
    @code = Code.find(params[:id])
    @code.destroy
    redirect_to admin_user_manage_path(current_admin_user.id)
  end
 
  private
    def code_params
      params.require(:code).permit(:logInCode, :searchOption, :querySuggestion, :search_intent)
    end
end
