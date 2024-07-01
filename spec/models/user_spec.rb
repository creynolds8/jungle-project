require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do 
    describe "Password validation" do
      it "should validate password value" do
        @user = User.new name: "TEST", email: "test@test.com", password_confirmation: "TEST"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "should validate password confirmation value" do
        @user = User.new name: "TEST", email: "test@test.com", password: "TEST"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it "should verify password and password_confirmation fields match" do
        @user = User.new name: "TEST", email: "test@test.com", password: "TEST", password_confirmation: "TEST"
        expect(@user.password_confirmation).to eq(@user.password)
      end
      it "should give an error if password and password_confirmation fields dont match" do
        @user = User.new name: "TEST", email: "test@test.com", password: "TEST", password_confirmation: "Test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      describe "Password length validation" do
        it "should give an error is the password is too short" do
          @user = User.new name: "TEST", email: "test@test.com", password: "TEST", password_confirmation: "TEST"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
        end
        it "should give an error is the password is too long" do
          @user = User.new name: "TEST", email: "test@test.com", password: ">20characterlongpassword", password_confirmation: ">20characterlongpassword"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too long (maximum is 20 characters)")
        end
      end
    end
    describe "Email validation" do
      it "should validate email value" do
        @user = User.new name: "TEST", password: "TEST", password_confirmation: "TEST"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "should validate a unique email" do
        @user1 = User.new name: "TEST", email: "test@test.com", password: "TESTTEST", password_confirmation: "TESTTEST"
        @user1.save!
        @user2 = User.new name: "TEST", email: "TEst@test.com", password: "TEST", password_confirmation: "TEST"
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
    end
    describe "Name validation" do
      it "should validate the name value" do
        @user = User.new email: "test@test.com", password: "TEST", password_confirmation: "TEST"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
  describe ".authenticate_with_credentials" do
    before do
      @user = User.create(name: "TEST", email: "test@test.com", password: "password", password_confirmation: "password")
    end
    it "should do authenticate with correct credentials" do
      authenticated_user = User.authenticate_with_credentials("test@test.com", "password")
      expect(authenticated_user).to eq(@user)
    end
    it "should authenticate in spite of white space for correct credentials" do
      authenticated_user = User.authenticate_with_credentials("   test@test.com   ", "password")
      expect(authenticated_user).to eq(@user)
    end
    it "should authenticate in spite of case incorrectness for correct credentials" do
      authenticated_user = User.authenticate_with_credentials("TEST@tEst.Com", "password")
      expect(authenticated_user).to eq(@user)
    end
    it "should return nil for incorrect password" do
      authenticated_user = User.authenticate_with_credentials("test@test.com", "WRONG")
      expect(authenticated_user).to be_nil
    end
    it "should fail authentication for non-exsistent email" do
      authenticated_user = User.authenticate_with_credentials("notvalid@email.com", "password")
      expect(authenticated_user).to be_nil
    end
  end
end
