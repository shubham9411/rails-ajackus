# frozen_string_literal: true

json.extract! contact, :id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
