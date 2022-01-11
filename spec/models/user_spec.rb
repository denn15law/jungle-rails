require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is valid when email, first/last name, password, password confirmation are inputted" do
      @user = User.new
      @user.firstName = 'test'
      @user.lastName = 'test'
      @user.email = 'test@test.com'
      @user.password = "test1"
      @user.password_confirmation = 'test1'

      @user.save

      expect(@user).to be_valid

    end
    it "is invalid when first name is empty" do
      @user = User.new
      @user.firstName = nil
      @user.lastName = 'test'
      @user.email = 'test@test.com'
      @user.password = "test1"
      @user.password_confirmation = 'test1'

      @user.save

      expect(@user).to_not be_valid
    end
    it "is invalid when last name is empty" do
      @user = User.new
      @user.firstName = 'test'
      @user.lastName = nil
      @user.email = 'test@test.com'
      @user.password = "test1"
      @user.password_confirmation = 'test1'

      @user.save

      expect(@user).to_not be_valid
    end
    it "is invalid when email is empty" do
      @user = User.new
      @user.firstName = 'test'
      @user.lastName = 'test'
      @user.email = nil
      @user.password = "test1"
      @user.password_confirmation = 'test1'

      @user.save

      expect(@user).to_not be_valid
    end
    it "is invalid when email is empty" do
      @user = User.new
      @user.firstName = 'test'
      @user.lastName = 'test'
      @user.email = nil
      @user.password = "test1"
      @user.password_confirmation = 'test1'

      @user.save

      expect(@user).to_not be_valid
    end
    it "is invalid when password is empty" do
      @user = User.new
      @user.firstName = 'test'
      @user.lastName = 'test'             
      @user.email = 'test@test.com'
      @user.password = nil
      @user.password_confirmation = 'test1'

      @user.save

      expect(@user).to_not be_valid
    end
    it "is invalid when password confirmation is empty" do
      @user = User.new
      @user.firstName = 'test'
      @user.lastName = 'test'
      @user.email = 'test1'
      @user.password = 'test1'
      @user.password_confirmation = nil

      @user.save

      expect(@user).to_not be_valid
    end
    it "is invalid when password and password confirmation dont match" do
      @user = User.new
      @user.firstName = 'test'
      @user.lastName = 'test'
      @user.email = 'test@test.com'
      @user.password = "test1"
      @user.password_confirmation = 'test2'

      @user.save
      expect(@user).to_not be_valid
    end
    it "is invalid when email already exists (case-senstive)" do
      @user = User.new
      @user.firstName = 'test'
      @user.lastName = 'test'
      @user.email = 'test@test.com'
      @user.password = "test1"
      @user.password_confirmation = 'test1'
      @user.save

      @user2 = User.new
      @user2.firstName = 'test2'
      @user2.lastName = 'test2'
      @user2.email = 'TEST@TEST.COM'
      @user2.password = "test2"
      @user2.password_confirmation = 'test2'
      @user2.save

      expect(@user2).to_not be_valid
    end
    it "is invalid when password length is less than 5" do
      @user = User.new
      @user.firstName = 'test'
      @user.lastName = 'test'
      @user.email = 'test@test.com'
      @user.password = "a"
      @user.password_confirmation = 'a'

      @user.save
      expect(@user).to_not be_valid
    end
  end
  describe ".authenticate_with_credentials" do
    it "returns the user if email and password match exisitng user" do
      @user = User.new
      @user.firstName = 'test'
      @user.lastName = 'test'
      @user.email = 'test@test.com'
      @user.password = "test12"
      @user.password_confirmation = 'test12'
      @user.save

      @authenticate = User.authenticate_with_credentials('test@test.com', 'test12')

      expect(@authenticate).to eql(@user)

    end
    it "returns the user if email and password match with white spaces before/after email" do
      @user = User.new
      @user.firstName = 'test'
      @user.lastName = 'test'
      @user.email = 'test@test.com'
      @user.password = "test12"
      @user.password_confirmation = 'test12'
      @user.save

      @authenticate = User.authenticate_with_credentials('  test@test.COM  ', 'test12')

      expect(@authenticate).to eql(@user)
    end
  end
end
