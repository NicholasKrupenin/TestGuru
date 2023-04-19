module ApplicationHelper
  def question_header(question)
    if question.persisted?
      "Edit #{question.test.title} Question"
    else
      "Create New #{question.test.title} Question"
    end
  end

  def github_url(author, repo, html_options = {rel: 'nofollow', rel: 'noopener'})
    link_to repo.to_s, "https://github.com/#{author}/#{repo}", html_options
  end

  def now_year
    Time.current.year
  end

  def flash_message(type)
    content_tag :div, flash[type], class: "flash #{type}" if flash[type]
  end
end
