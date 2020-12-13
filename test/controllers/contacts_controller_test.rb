# frozen_string_literal: true

require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test 'should get index' do
    get contacts_url
    assert_response :success
  end

  test 'should get new' do
    get new_contact_url
    assert_response :success
  end

  test 'should create contact' do
    assert_difference('Contact.count') do
      post contacts_url, params: {
        contact: {
          first_name: 'Mark',
          last_name: 'Twain',
          email: 'mark@example.com',
          message: 'Honesty: The best of all the lost arts'
        }
      }
    end

    assert_redirected_to contact_url(Contact.last)
  end

  test 'should not create contact' do
    assert_no_changes('Contact.count') do
      post contacts_url, params: {
        contact: {
          first_name: 'Mark',
          email: 'mark@example.com',
          message: 'Honesty: The best of all the lost arts'
        }
      }
    end

    assert_response :success
  end

  test 'should show contact' do
    get contact_url(@contact)
    assert_response :success
  end

  test 'should get edit' do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test 'should update contact' do
    patch contact_url(@contact), params: { contact: {} }
    assert_redirected_to contact_url(@contact)
  end

  test 'should not update contact' do
    patch contact_url(@contact), params: { contact: {first_name: ''} }
    assert_response :success
  end

  test 'should destroy contact' do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end
