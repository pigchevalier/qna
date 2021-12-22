class AnswersController < ApplicationController
  helper_method :answer
  helper_method :question

  def show; end

  def new; end

  def create
    @answer = question.answers.build(answers_params)

    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  private

  def answer
    @answer ||= params[:id] ? Answer.find(params[:id]) : Answer.new
  end

  def question
    @question ||= Question.find(params[:question_id])
  end 

  def answers_params
    params.require(:answer).permit(:body)
  end
end
