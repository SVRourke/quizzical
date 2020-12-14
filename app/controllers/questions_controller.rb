class QuestionsController < ApplicationController
    before_action :unauthorized_redirect
    after_action :verify_authorized

    def new
        authorize Question, :new?
        @quiz = Quiz.find(params[:quiz_id])
        @question = Question.new
        4.times {@question.answers.build}
    end

    def create
        authorize Question, :create?
        @question = Question.create(question_params)

        redirect_to new_quiz_question_path(@question.quiz) and return if @question.valid?

        @quiz = @question.quiz
        render :new
    end

    def destroy
        @question = Question.find(params[:id])
        authorize @question
        @question.destroy
        redirect_to new_quiz_question_path(params[:quiz_id])
    end

    private

    def question_params
        params.require(:question).permit(:quiz_id, :content, :answers_attributes => {})
    end

end