# frozen_string_literal: true

require 'application_system_test_case'

class ContactsTest < ApplicationSystemTestCase
  setup do
    @contact = contacts(:one)
  end

  test 'visiting the index' do
    visit contacts_url
    assert_selector 'span', text: 'Send Us A Message'
    assert_selector 'span', text: 'Address'
    assert_selector 'span', text: 'Lets Talk'
    assert_selector 'label', text: 'TELL US YOUR NAME'
    assert_selector 'label', text: 'ENTER YOUR EMAIL'
    assert_selector 'label', text: 'ENTER PHONE NUMBER'
    assert_selector 'label', text: 'MESSAGE'
  end

  test 'creating a Contact' do
    visit contacts_url
    fill_in 'contact[first_name]', with: 'Mark'
    fill_in 'contact[last_name]', with: 'Twain'
    fill_in 'contact[email]', with: 'mark@example.com'
    fill_in 'contact[message]', with: 'Honesty: The best of all the lost arts'
    find('input[name="commit"]').click
  end
end
