class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes

  before_create :confirmation_token

  enum email_confirmed: { uncomfirmed: 0, confirmed: 1 }
  enum two_factor: { false: 0, true: 1, two_factor_confirm: 2, two_factor_uncomfirmed: 3 }
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

  def add_two_factor
    self.two_factor = 1
    save
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
