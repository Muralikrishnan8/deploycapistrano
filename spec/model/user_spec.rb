require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(first_name: 'fname', email: 'xyz@anymail.com', password:'password');
    user.save
    expect(user).to be_valid
  end

  it "is invalid without first_name" do
    contact = User.new(email: 'xyz@anymail.com', password:'password');
    contact.save
    expect(contact).to_not be_valid
  end

  it "is invalid without email" do
    contact =  User.new(first_name: 'fname', password:'password');
    contact.save
    expect(contact).to_not be_valid
  end

  it "is valid with same email" do
    User.create(first_name: 'fname', email: 'xyz@anymail.com', password:'password');
    user = User.new(first_name: 'fname', email: 'xyz@anymail.com', password:'password');
    user.save
    expect(user).to_not be_valid
  end

  it "is invalid without password" do
    contact =  User.new(first_name: 'fname', email: 'xyz@anymail.com');
    contact.save
    expect(contact).not_to be_valid
  end
end