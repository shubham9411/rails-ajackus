# frozen_string_literal: true

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test 'valid contact' do
    contact = Contact.new(
      first_name: 'Mark',
      last_name: 'Twain',
      email: 'mark@example.com',
      message: 'Honesty: The best of all the lost arts'
    )
    assert contact.valid?
  end

  test 'invalid contact without first_name' do
    contact = Contact.new(
      last_name: 'Twain',
      email: 'mark@example.com',
      message: 'Honesty: The best of all the lost arts'
    )
    assert_not contact.valid?
    assert_not_nil contact.errors[:first_name]
  end

  test 'invalid contact without second_name' do
    contact = Contact.new(
      first_name: 'Mark',
      email: 'mark@example.com',
      message: 'Honesty: The best of all the lost arts'
    )
    assert_not contact.valid?
    assert_not_nil contact.errors[:last_name]
  end

  test 'invalid contact without email' do
    contact = Contact.new(
      first_name: 'Mark',
      last_name: 'Twain',
      message: 'Honesty: The best of all the lost arts'
    )
    assert_not contact.valid?
    assert_not_nil contact.errors[:email]
  end

  test 'invalid contact without message' do
    contact = Contact.new(
      first_name: 'Mark',
      last_name: 'Twain',
      email: 'mark@example.com'
    )
    assert_not contact.valid?
    assert_not_nil contact.errors[:message]
  end
end
