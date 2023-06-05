class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes

  before_create :confirmation_token

  enum email_confirmed: { uncomfirmed: 0, confirmed: 1 }
  MAILER_FROM_EMAIL = 'no-reply@example.com'


  def email_activate
    self.email_confirmed = 1
    self.confirm_token = nil
    save!(:validate => false)
  end

  def send_confirmation_email
    confirmation_token = generate_confirmation_token
    if self.confirm_token 
      UserMailer.confirmation_email(self, self.confirm_token).deliver_now
    else
      UserMailer.confirmation_email(self, confirmation_token).deliver_now
    end
  end

  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
