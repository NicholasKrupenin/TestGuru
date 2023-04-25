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

  def mail_name(mail)
    mail.split('@').first
  end
end
