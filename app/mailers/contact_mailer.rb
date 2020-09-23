class ContactMailer < ApplicationMailer
  def email_contact_info(contact)
    @contact = contact
    mail(to: 'info@ajackus.com', subject: 'User contacted for further info')
  end
end
