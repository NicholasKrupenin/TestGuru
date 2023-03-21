class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new]

  rescue_from ActiveRecord::RecordNotFound, with: :test_not_found

  def index; end

  def new; end

  def create
    @question = Question.create(question_params)
    if @question.save
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def destroy

    @question = Question.find(params[:id])
    @question.destroy

    render plain: 'Question was deleted!'
    #redirect_to test_questions_path
  end

  private

  def question_params
    params.permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def test_not_found
    render plain: 'Test was not found!'
  end
end
