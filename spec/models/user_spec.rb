require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    # it "is valid with valid attributes" do
    #   user = User.create!(email: "sample@mail.com", password: "password")
    #   expect(user).to be_valid
    # end

  #   it "is not valid without an email" do
  #     user = User.create(email: nil, password: "password123")
  #     expect(user).not_to be_valid
  #     expect(user.errors[:email]).to include("can't be blank")
  #   end

  #   it "is not valid without a password" do
  #     user = User.create(email: "sample@mail.com", password: nil)
  #     expect(user).not_to be_valid
  #     expect(user.errors[:password]).to include("can't be blank")
  #   end

  #   it "is not valid with a taken email" do
  #     User.create!(email: "sample@mail.com", password: "password")
  #     user = User.create(email: "sample@mail.com", password: "password")
  #     expect(user).not_to be_valid
  #     expect(user.errors[:email]).to include("has already been taken")
  #   end
  end

  describe "Devise methods" do
    it "authenticated with a valid password" do
      user = User.create!(email: "sample@mail.com", password: "password")
      expect(user.valid_password?("password")).to be_truthy
    end

    it "does not authenticate with an invalid password" do
      user = User.create!(email: "user@sample.com", password: "password123")
      expect(user.valid_password?("password")).to be_falsey
    end
  end
end
