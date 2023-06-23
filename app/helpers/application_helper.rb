module ApplicationHelper
  def question_header(question)
    if question.persisted?
      "Edit #{question.test.title} Question"
    else
      "Create New #{question.test.title} Question"
    end
  end

  def github_url(author, repo, html_options = { rel: 'nofollow noopener' })
    link_to repo.to_s, "https://github.com/#{author}/#{repo}", html_options
  end

  def now_year
    Time.current.year
  end

  def flash_message(type)
    content_tag :div, flash[type], class: "flash #{type}" if flash[type]
  end

  def mail_name(mail)
    mail.split('@').first
  end

  def badge_appear(user)
    Badge.badge_return_hash.map do |badge_name, badge_url|
      user.badges.map do |name, _value|
        if badge_name == name
          image_tag("#{badge_url}", alt: "#{badge_name}", width: 30, height: 30)
        end
      end
    end.join.html_safe
  end
end
