require 'rails_helper'

RSpec.describe User, type: :model do
 
  describe 'Validations' do
    # validation examples here
    it 'has a password and password confirmation' do
      @user = User.new({name: 'name', email: 'me@email.com', password: 'apple', password_confirmation: 'apple'})
      @user.save

      expect(@user.password).to be == @user.password_confirmation
    end

    it'has a unique email' do
      @user = User.new({name: 'name', email: 'me@email.com', password: 'apple', password_confirmation: 'apple'})
      @user.save
      @user2 = User.new({name: 'name', email: 'me@email.com', password: 'apple', password_confirmation: 'apple'})
      @user2.save
    
      expect(@user2.errors.messages[:email]).to eq ["has already been taken"]

    end

    it 'has a email and name' do
      @user = User.new({name: 'name', email: 'me@email.com', password: 'apple', password_confirmation: 'apple'})
      @user.save

      expect(@user.email).to be == ("me@email.com")
      expect(@user.name).to be == ("name")
    end

    it 'password must be at least 3 characters long' do
      @user = User.new({name: 'name', email: 'me@email.com', password: 'apple', password_confirmation: 'apple'})
      @user.save

      expect(@user.password.length).to have_attributes(size: (be > 2))
    end
    
  end
  
  describe '.authenticate_with_credentials' do
    it 'authenticates the user with email and password' do
      @user = User.new({name: 'name', email: 'me@email.com', password: 'apple', password_confirmation: 'apple'})
      @user.save
      dog = User.authenticate_with_credentials('me@email.com', 'apple')

      expect(dog).to_not be_nil

    end

    it 'does not authenticates the user with email and password' do
      @user = User.new({name: 'name', email: 'me@email.com', password: 'apple', password_confirmation: 'apple'})

      dog = User.authenticate_with_credentials('me@email.com', 'apple')

      expect(dog).to be_nil

    end

    it 'accepts emails with whitespace' do
      @user = User.new({name: 'name', email: 'me@email.com', password: 'apple', password_confirmation: 'apple'})
      @user.save

      dog = User.authenticate_with_credentials('  me@email.com', 'apple')
      expect(dog).to_not be_nil
    end
    
    it 'accepts emails with capitals and lowercase' do
      @user = User.new({name: 'name', email: 'me@email.com', password: 'apple', password_confirmation: 'apple'})
      @user.save

      dog = User.authenticate_with_credentials('Me@email.com', 'apple')
      expect(dog).to_not be_nil
    end
  end

end
