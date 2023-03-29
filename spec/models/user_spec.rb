require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'must be created with a password and password_confirmation fields' do
     
      user = User.new 
      user.first_name = 'tested'
      user.last_name = 'tested'  
      user.email = 'test@test.com' 
      user.password = 'p@ssword12' 
      user.password_confirmation = 'not_p@ssword12'
      expect(user.save).to be_falsey
    end
    it 'Emails must be unique' do
      user = User.new
      user.first_name = 'tested'
      user.last_name = 'tested' 
      user.email = 'TEST@test.com' 
      user.password = 'p@ssword12' 
      user.password_confirmation = 'p@ssword12' 
      user.save
      user2 = User.new
      user2.first_name = 'tested'
      user2.last_name = 'tested' 
      user2.email = 'test@test.com' 
      user2.password = 'p@ssword12' 
      user2.password_confirmation = 'p@ssword12' 
      expect(user2.save).to be_falsey
    end
    it 'Email, first name, and last name should also be required' do
      user = User.new 
      user.password = 'p@ssword12' 
      user.password_confirmation = 'p@ssword12' 
      expect(user.save).to be_falsey
    end
    it 'password must have a minimum length when a user account is being created' do
      user = User.new
      user.first_name = 'tested'
      user.last_name = 'tested'  
      user.email = 'test@test.com' 
      user.password = 'p@s12' 
      user.password_confirmation = 'p@s12'
      expect(user.save).to be_falsey
      user = User.new 
    end
    
  end
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'spaces before and/or after should not affect authorization' do
      user = User.new 
      user.first_name = 'tested'
      user.last_name = 'tested'  
      user.email = 'test@test.com' 
      user.password = 'p@sss12' 
      user.password_confirmation = 'p@sss12'
      user.save

      new_user = User.authenticate_with_credentials('    test@test.com    ',user.password)
      expect(new_user).to be_truthy
    end
    it 'the wrong case for their email should not affect authorization' do
      user = User.new 
      user.first_name = 'tested'
      user.last_name = 'tested'  
      user.email = 'test@test.com' 
      user.password = 'p@sss12' 
      user.password_confirmation = 'p@sss12'
      user.save

      new_user = User.authenticate_with_credentials('TeST@test.com',user.password)
      expect(new_user).to be_truthy
      user = User.new 
    end
  end
    
end
