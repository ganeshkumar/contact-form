require 'rails_helper'

RSpec.describe Api::V1::ContactsController, type: :controller do
  it 'POST#create should create entry in db with valid params' do
    contact_params = {
      contact: {
        first_name: 'foo',
        last_name: 'bar',
        email: 'foobar@example.com',
        phone_number: '1800100100',
        message: 'test message'
      }
    }
    post :create, params: contact_params, format: :json

    expect(Contact.count).to eq 1
    expect(response).to have_http_status(:created)
    expect(response.content_type).to eq "application/json"
  end

  it 'POST#create should send email after create an entry to db' do
    contact_params = {
      contact: {
        first_name: 'foo',
        last_name: 'bar',
        email: 'foobar@example.com',
        phone_number: '1800100100',
        message: 'test message'
      }
    }
    # Make sure deliveries is zero
    expect(ActionMailer::Base.deliveries.count).to eq 0

    post :create, params: contact_params, format: :json

    expect(Contact.count).to eq 1
    expect(response).to have_http_status(:created)
    expect(response.content_type).to eq "application/json"


    last_delivery = ActionMailer::Base.deliveries.last
    expect(ActionMailer::Base.deliveries.count).to eq 1
    expect(last_delivery.subject).to eq("User contacted for further info")
    expect(last_delivery.to).to eq(['info@ajackus.com'])
    expect(last_delivery.body.encoded).to match('foo bar')
  end

  it 'POST#create should not create entry in db with in-valid params' do
    contact_params = {
      contact: {
        first_name: 'foo'
      }
    }
    post :create, params: contact_params, format: :json
    json_response = JSON.parse(response.body)['error']

    expect(Contact.count).to eq 0
    expect(response).to have_http_status(:unprocessable_entity)
    expect(response.content_type).to eq "application/json"
    expect(json_response).to match(/Validation failed: Last name can't be blank/)
    expect(json_response).to match(/Email can't be blank/)
    expect(json_response).to match(/Email is invalid/)
    expect(json_response).to match(/Message can't be blank/)
  end
end
