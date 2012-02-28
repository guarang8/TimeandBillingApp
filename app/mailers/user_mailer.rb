class UserMailer < ActionMailer::Base
  default from: "manish.gauranga@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(email)
    @email = email
    #attachments['thingy.pdf'] = File.read('/somewhere/on/disk')
    mail to: email, :subject => "Hare Krishna"
  end
end
