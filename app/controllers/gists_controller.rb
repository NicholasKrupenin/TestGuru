class GistsController < ApplicationController
  before_action :test_passages, only: :create

  def create
    new_gist = GistQuestionService.new(@test_passage.current_question)
    new_gist.call

    if new_gist.successful?
      Gist.create(question: @test_passage.current_question, user: current_user,
                                                                       gist_url: new_gist.show_url)
      flash[:notice] = t('.success', url: new_gist.show_url)
    else
      flash[:alert] = t('.failure')
    end
    redirect_to test_passage_path(@test_passage)
  end

  private

  def test_passages
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
