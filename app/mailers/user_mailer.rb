class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
   layout "mailer"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact.subject
  #
  def send_mail(email)
    mail to: email, subject: 'Welcome', body: 'body message'
    
  end
end
