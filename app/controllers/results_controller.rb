class ResultsController < ApplicationController
    def new
        @quiz = Quiz.find(params[:quiz_id])
        @result = Result.new
        @quiz.questions.count.times do
            @result.answers.build()
        end
    end

    private

    def result_params
        params.require(:result).permit(:quiz_id, answers: [])
    end
end

