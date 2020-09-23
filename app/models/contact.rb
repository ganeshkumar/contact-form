class Contact < ApplicationRecord
  validates :first_name, :last_name, :email, :message, presence: true
  validates :email,
            format: %r{\A(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6}\z}i
end
