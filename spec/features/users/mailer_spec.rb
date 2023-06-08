require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'confirmation' do
    before(:each) do
      @user = User.create!(username: "balogna", email: "bologna@hotmail.com", email_confirmed: 1)
      @mail = UserMailer.confirmation_email(@user, 12345)
    end

    it 'renders the headers' do
      expect(@mail.subject).to eq('Confirmation')
      expect(@mail.to).to eq(["bologna@hotmail.com"])
      expect(@mail.from).to eq(['no-reply@example.com'])
    end

    it 'renders the body' do
      expect(@mail.body.encoded).to eq("<h1>Confirmation Instructions</h1>\r\nYour code is: 12345\r\n\r\nOR\r\n\r\n<a href=\"http://localhost:3000/confirmations/12345/edit\">Click here to confirm your email.</a>")
    end
  end
end
