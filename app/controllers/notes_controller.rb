class NotesController < ApplicationController
    def new
        @quiz = Quiz.find(params[:id])
        @note = Note.new(quiz: @quiz)
    end

    def create
        Note.create(note_params)
        redirect_to :dashboards
    end

    private

    def note_params
        params.require(:note).permit(:quiz_id, :user_id, :content)
    end
   
end
