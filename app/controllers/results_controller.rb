class ResultsController < ApplicationController
    def new
        @result = Quiz.find(params[:quiz_id]).results.build()
        @result.quiz.questions.each do |q|
            @result.answered_questions.build(question: q)
        end
    end

    def create
        @result = Quiz.find(result_params).results.build(result_params)
        @result.user = current_user

        if @result.save
            redirect_to dashboards_path
        else
            puts @result.errors.full_messages
        end
    end

    private

    def result_params
        params.require(:result).permit( :quiz_id, answered_questions_attributes: [:answer_id, :question_id])
    end
end
