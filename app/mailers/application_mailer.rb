class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name('development@guru.com', 'TestGuru')
  layout 'mailer'
end
