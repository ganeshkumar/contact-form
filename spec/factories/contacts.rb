FactoryGirl.define do
  factory :contact do
    first_name "foo"
    last_name "bar"
    email "foobar@example.com"
    phone_number "1800100200"
    message "test message"
  end
end
