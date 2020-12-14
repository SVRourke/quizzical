class ResultsController < ApplicationController
    before_action :unauthorized_redirect
    after_action :verify_authorized

    def new
        authorize Result, :new?
        @result = Quiz.find(params[:quiz_id]).build_result()
    end
    
    def create
        authorize Result, :create?
        @result = Result.new(result_params.merge({user: current_user}))
        redirect_to group_path(@result.quiz.group) and return if @result.save
        render :new
    end

    private

    def result_params
        params.require(:result).permit(
            :quiz_id, 
            answered_questions_attributes: [ :answer_id, :question_id]
        )
    end
end
