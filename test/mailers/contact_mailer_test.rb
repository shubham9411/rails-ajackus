# frozen_string_literal: true

require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  def setup
    @contact = contacts(:one)
  end

  test 'contact_form_submission' do
    email = ContactMailer.contact_form_submission(@contact)
    assert_emails 1 do
      email.deliver_later
    end

    assert_equal email.to, ['info@ajackus.com']
    assert_equal email.from, ['noreply@example.com']
    assert_equal email.subject, 'Contact form submission'
    assert_match 'New Contact form submission', email.body.encoded
    assert_match @contact.first_name, email.body.encoded
    assert_match @contact.last_name, email.body.encoded
    assert_match @contact.email, email.body.encoded
    assert_match @contact.phone_number, email.body.encoded
    assert_match @contact.message, email.body.encoded
  end
end
