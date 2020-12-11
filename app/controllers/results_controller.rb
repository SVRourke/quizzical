class ResultsController < ApplicationController
    before_action :unauthorized_redirect
    after_action :verify_authorized

    def new
        authorize Result, :new?
        @result = Quiz.find(params[:quiz_id]).results.build()
        @result.quiz.questions.each do |q|
            @result.answered_questions.build(question: q)
        end
    end
    
    # REFACTOR FOR VALIDATIONS
    def create
        authorize Result, :create?
        @result = Result.new(result_params)
        @result.user = current_user

        if @result.save
            redirect_to dashboards_path and return
        end
        render :new
    end

    private

    def result_params
        params.require(:result).permit(
            :quiz_id, 
            answered_questions_attributes: [
                :answer_id, 
                :question_id
                ]
            )
    end
end
