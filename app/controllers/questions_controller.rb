class QuestionsController < ApplicationController
    def new
        @quiz = Quiz.find(params[:quiz_id])
        @question = Question.new
        4.times do
            @question.answers.build
        end
    end

    def create
        5.times {puts ""}
        puts params
        5.times {puts ""}
        redirect_back fallback_location: '/'
    end

end