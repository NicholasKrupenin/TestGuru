class GistQuestionService
  attr_reader :client

  def initialize(question)
    @question = question
    @test = @question.test
    @client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  def successful?
    @client.last_response.status == 201
  end

  def show_url
    @client.last_response.data.html_url
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body].union(@question.answers.pluck(:body)).join("\n")
  end
end
