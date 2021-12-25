class AnswersController < ApplicationController
  helper_method :answer
  helper_method :question

  before_action :authenticate_user!, except: [:show]

  def show; end

  def new
    render 'questions/show', id: question
  end

  def create
    @answer = question.answers.build(answers_params)
    @answer.user = current_user

    if @answer.save
      redirect_to @answer, notice: 'Your answer successfully created'
    else
      render 'questions/show', id: question
    end
  end

  def destroy
    if answer.user == current_user
      answer.destroy
      redirect_to answer.question, notice: 'Your answer successfully deleted'
    else
      redirect_to answer, alert: "You are not author of this answer"
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
