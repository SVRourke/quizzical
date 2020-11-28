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

    def destroy
        Question.find(params[:id]).destroy
        redirect_to new_quiz_question_path(params[:quiz_id])
    end

    private

    def question_params
        params.require(:question).permit(:quiz_id, :content, :answers_attributes => {})
    end

end