class UserMailer < ActionMailer::Base
  default from: User::MAILER_FROM_EMAIL

  def confirmation_email(user, confirmation_token)
    @user = user
    @confirmation_token = confirmation_token
    mail to: user.email, subject: "Confirmation"
  end
end