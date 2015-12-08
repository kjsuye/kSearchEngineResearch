class StudentUsersController < ApplicationController
 before_action :logged_in_student_user, only: [:show]

 helper_method :get_search_results


  def show
    if session[:student_user_id] != params[:id].to_i
      redirect_to current_student_user
    else
      @student_user = StudentUser.find(params[:id])
      @query = @student_user.queries.build
    end
  end
      
  def new
    @student_user = StudentUser.new
    @query = @student_user.queries.build
  end
 
  def create
    @student_user = StudentUser.new
    currentCode = Code.where(logInCode: params[:student_user][:logInCode]).take
    if currentCode
      code_params = currentCode.attributes
      code_params.except!("id", "timesUsed", "created_at", "updated_at")
      new_params = student_user_params.merge(code_params)
      @student_user = StudentUser.create(new_params)
      if @student_user.save
        currentCode.increment!(:timesUsed)
        student_log_in @student_user
        redirect_to @student_user
      else
        render 'new'
      end
    else
      flash.now[:danger] = 'Invalid Log In Code'
      render 'new'
    end
    GoogleCustomSearch.initialize_search
  end

  def get_search_results
    data = GoogleCustomSearch.get_response
    if data
      data = JSON.parse data.response.body
      items = data["items"]
    end
  end

   def getAllData
    @students = StudentUser.all
    respond_to do |format|
      format.csv { send_data @students.to_csv }
    end
  end


  private
  
    def student_user_params
      params.require(:student_user).permit(:logInCode, :grade)
    end


end
