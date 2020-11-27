class QuestionsController < ApplicationController
    def new
        @quiz = Quiz.find(params[:quiz_id])
        @question = Question.new
        4.times do
            @question.answers.build
        end
    end

    def create
        @question = Question.create(question_params)
        redirect_back fallback_location: '/'
    end

    private

    def question_params
        params.require(:question).permit(:quiz_id, :content, :answers_attributes => {})
    end

end