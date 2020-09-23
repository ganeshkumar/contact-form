# frozen_string_literal: true

class Api::V1::ContactsController < ApplicationController
  include Response
  include ExceptionHandler

  # POST /contacts
  def create
    @contact = Contact.create!(contact_params)
    ContactMailer.email_contact_info(@contact).deliver_now!
    json_response(@contact, :created)
  end

  private

  def contact_params
     params.
     require(:contact).
     permit(:first_name, :last_name, :email, :phone_number, :message)
  end
end
