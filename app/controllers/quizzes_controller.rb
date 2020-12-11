class QuizzesController < ApplicationController
    before_action :unauthorized_redirect
    after_action :verify_authorized

    def new
        authorize Quiz, :new?
        @group = Group.find(params[:group_id])
        @quiz = Quiz.new
    end
    
    def create
        authorize Quiz, :create?
        
        @quiz = Quiz.new(quiz_params)
        @quiz.group = Group.find(params[:group_id])

        if @quiz.save
            redirect_to new_quiz_question_path(@quiz) and return
        end

        render :new
    end

    def publish
        authorize Quiz, :publish?
        @quiz = Quiz.find(params[:id])
        @quiz.update(published: true)
        redirect_to group_path(@quiz.group)
    end
    
    def show
        authorize Quiz, :show?
        @quiz = Quiz.find(params[:id])
    end

    private
    
    def quiz_params
        params.require(:quiz).permit(:name)
    end

end