require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  describe 'email_contact_info' do
    let(:mail) { ContactMailer.email_contact_info(build(:contact)) }

    it 'renders the subject' do
      expect(mail.subject).to eql('User contacted for further info')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql(['info@ajackus.com'])
    end

    it 'renders the first_name and last_name' do
      expect(mail.body.encoded).to match('foo bar')
    end

    it 'renders the email' do
      expect(mail.body.encoded).to match('foobar@example.com')
    end
  end
end
