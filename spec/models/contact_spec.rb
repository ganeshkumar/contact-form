describe Contact, type: :model do
  it 'validate presence of first_name, last_name, email, message and format of email' do
    contact = build(:contact,
                    first_name: '',
                    last_name: '',
                    email: '',
                    message: '')
    contact.valid?

    expect(contact.errors[:first_name].size).to eq(1)
    expect(contact.errors[:last_name].size).to eq(1)
    expect(contact.errors[:email].size).to eq(2)
    expect(contact.errors[:message].size).to eq(1)
  end

  it 'validate format of email' do
    contact = build(:contact, email: 'foobar@')

    contact.valid?
    expect(contact.errors[:email].size).to eq(1)
  end
end
