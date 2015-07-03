class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :set_answer, only: [:upvote, :accept]

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question

    if @question.answerable && @answer.save
      redirect_to question_path(@question), notice: "Answer was successfully created."
    else
      redirect_to question_path(@question), alert: "There was an error when adding answer."
    end
  end

  def upvote
    @answer.upvote_by current_user
    respond_to do |format|
      format.html { redirect_to question_path(@question), notice: "Thank you for liking" }
      format.js {}
    end
  end

  def accept
    @answer.update(accepted: true)
    redirect_to question_path(@question), notice: "Answer was accepted."
  end

  private
    

    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:contents)
    end
end
