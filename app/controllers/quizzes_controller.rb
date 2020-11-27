class QuizzesController < ApplicationController
    def new
        @group = Group.find(params[:group_id])
        @quiz = Quiz.new
    end

    def create
        @quiz = Quiz.new(quiz_params)
        @group = Group.find(params[:group_id]) 
        @quiz.group = @group
        if @quiz.save
            # redirect to quiz questions
            redirect_to new_quiz_question_path(@quiz)
        else
            redirect_back fallback_location: group_path(@group)
        end
    end

    private
    
    def quiz_params
        params.require(:quiz).permit(:name)
    end

end