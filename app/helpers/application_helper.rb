module ApplicationHelper
  def question_header
    if @question.persisted?
      "<h1>Edit #{@question.test.title} Question</h1>".html_safe
    else
      "<h1>Create New #{@test.title} Question</h1>".html_safe
    end
  end

  def github_url(author, repo)
    link_to repo.to_s, "https://github.com/#{author}/#{repo}"
  end

  def now_year
    Time.current.year
  end

  def signature(author, repo, alt_name = nil)
    alt_name ||= author
    out = <<~HTML
      <p>Year: #{now_year}</p>
      <p>GitHub page: #{github_url(author, repo)}</p>
      <p>Author: #{alt_name}</p>
      <p>School: <a rel=nofollow rel=noopener href=\"http://thinknetica.com/\">Учебный проект в онлайн-школе Thinknetica</a></p>
    HTML
    out.html_safe
  end
end
