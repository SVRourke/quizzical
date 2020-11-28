class ResultsController < ApplicationController
    def new
        @quiz = Quiz.find(params[:quiz_id])
        @result = Result.new
        @quiz.questions.count.times do
            @result.answers.build()
        end
    end

    def create
        @result = Result.create(result_params)
        redirect_to :dashboards
    end

    private

    def result_params
        params.require(:result).permit(:quiz_id, answers: [])
    end
end

