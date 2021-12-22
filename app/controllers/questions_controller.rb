class QuestionsController < ApplicationController
  helper_method :question

  def show; end

  def new; end

  def create
    @question = Question.new(questions_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  private

  def question
    @question ||= params[:id] ? Question.find(params[:id]) : Question.new
  end

  def questions_params
    params.require(:question).permit(:title, :body)
  end
end
