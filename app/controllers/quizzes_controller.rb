class QuizzesController < ApplicationController
    before_action :unauthorized_redirect
    after_action :verify_authorized

    def new
        authorize Quiz, :new?
        @quiz = Group.find(params[:group_id]).quizzes.build()
    end
    
    def create
        authorize Quiz, :create?
        @quiz = Quiz.new(quiz_params)
        redirect_to new_quiz_question_path(@quiz) and return if @quiz.save
        render :new
    end

    def publish
        authorize Quiz, :publish?
        @quiz = Quiz.find(params[:id])
        redirect_to group_path(@quiz.group) and return if @quiz.update(published: true)
        
        flash.notice << [@quiz.errors.full_messages]
        redirect_back fallback_location: "/"
    end
    
    def show
        authorize Quiz, :show?
        @quiz = Quiz.find(params[:id])
    end

    private
    
    def quiz_params
        params.require(:quiz).permit(:name, :group_id)
    end

end