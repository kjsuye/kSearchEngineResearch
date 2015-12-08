class QueriesController < ApplicationController
 before_action :logged_in_student_user, only: [:show, :getAllQueryData]

  def new
    @student_user = StudentUser.find(params[:student_user_id])
    @query = Query.new
  end

  def create
    @response = nil
    originalQueryString = query_params[:originalQueryString]
    @student_user = StudentUser.find(params[:student_user_id])

    if @student_user
      if @student_user[:search_intent] == 'enabled'
        updatedQueryString = compute_search_intent(originalQueryString)
        updated_params = query_params.merge({:updatedQueryString => updatedQueryString})
        actualSearchQuery = updatedQueryString
      else
        updated_params = query_params.merge({:updatedQueryString => originalQueryString})
        actualSearchQuery = originalQueryString
      end

      @query = @student_user.queries.create(updated_params)
      if @query
        session[:pastQueryString] = actualSearchQuery
        @response = GoogleCustomSearch.execute_query(actualSearchQuery)
      else
        flash.now[:danger] = 'Could not save query string; aborted search'
      end
    end
    redirect_to student_user_path(@student_user)
  end

  private

    def query_params
      params.require(:query).permit(:originalQueryString)
    end


end
