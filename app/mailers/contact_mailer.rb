# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  default from: 'noreply@example.com'
  default to:   'info@ajackus.com'

  def contact_form_submission(contact)
    @contact = contact
    mail(subject: 'Contact form submission')
  end
end
