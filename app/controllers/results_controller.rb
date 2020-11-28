class ResultsController < ApplicationController
    def new
        @quiz = Quiz.find(params[:quiz_id])
        @result = Result.new
        @quiz.questions.count.times do
            @result.answers.build()
        end
    end
end