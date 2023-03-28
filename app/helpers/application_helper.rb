module ApplicationHelper

  def question_header
    return "<h1>Edit #{@question.test.title} Question</h1>".html_safe if params[:action] == "edit"
    "<h1>Create New #{@test.title} Question</h1>".html_safe
  end

  def github_url(author, repo)
    "<a href=\"https://github.com/#{author}/#{repo}\">#{repo}</a>".html_safe
  end

  def now_year
    "#{Date.today.year}".html_safe
  end

  def author(author, repo, alt_name = nil)
    alt_name ||= author
    out = <<~HTML
    <p>Year: #{Date.today.year}
    <p> <a href=\"https://github.com/#{author}/#{repo}\">#{repo}</a>
    <p> Author: #{alt_name}"
    <p> <a href=\"http://thinknetica.com/\">Учебный проект в онлайн-школе Thinknetica</a>"
    HTML
    out.html_safe
  end
end
