class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])

    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(question: @test_passage.current_question, user: current_user,
                                                                       gist_url: result.show_url)
      flash[:notice] = t('.success_html', url: result.show_url)
    else
      flash[:alert] = t('.failure')
    end
    redirect_to test_passage_path(@test_passage)
  end
end
