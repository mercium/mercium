require 'spec_helper'

describe User do

  before(:each) do
    @user = Factory(:user)
  end

  describe 'database schema' do
    it { should have_db_column(:username).of_type(:string).with_options(:limit => 100, :null => false) }
    it { should have_db_column(:name).of_type(:string).with_options(:limit => 100, :null => false) }
    it { should have_db_column(:active).of_type(:boolean).with_options(:default => true, :null => false) }
    it { should have_db_column(:email).of_type(:string).with_options(:null => false) }
    it { should have_db_column(:encrypted_password).of_type(:string).with_options(:limit => 128, :null => false) }
    it { should have_db_column(:password_salt).of_type(:string).with_options(:null => false) }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:remember_token).of_type(:string) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
    it { should have_db_column(:sign_in_count).of_type(:integer).with_options(:default => 0) }
    it { should have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { should have_db_column(:last_sign_in_at).of_type(:datetime) }
    it { should have_db_column(:current_sign_in_ip).of_type(:string) }
    it { should have_db_column(:last_sign_in_ip).of_type(:string) }
    it { should have_db_column(:failed_attempts).of_type(:integer).with_options(:default => 0) }
    it { should have_db_column(:unlock_token).of_type(:string) }
    it { should have_db_column(:locked_at).of_type(:datetime) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:username).unique(true) }
    it { should have_db_index(:email).unique(true) }
    it { should have_db_index(:reset_password_token).unique(true) }
    it { should have_db_index(:unlock_token).unique(true) }
  end

  describe 'attributes' do
    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:username) }
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
    it { should allow_mass_assignment_of(:remember_me) }

    it { should_not allow_mass_assignment_of(:active) }
    it { should_not allow_mass_assignment_of(:encrypted_password) }
    it { should_not allow_mass_assignment_of(:password_salt) }
    it { should_not allow_mass_assignment_of(:reset_password_token) }
    it { should_not allow_mass_assignment_of(:remember_token) }
    it { should_not allow_mass_assignment_of(:remember_created_at) }
    it { should_not allow_mass_assignment_of(:sign_in_count) }
    it { should_not allow_mass_assignment_of(:current_sign_in_at) }
    it { should_not allow_mass_assignment_of(:last_sign_in_at) }
    it { should_not allow_mass_assignment_of(:current_sign_in_ip) }
    it { should_not allow_mass_assignment_of(:last_sign_in_ip) }
    it { should_not allow_mass_assignment_of(:failed_attempts) }
    it { should_not allow_mass_assignment_of(:unlock_token) }
    it { should_not allow_mass_assignment_of(:locked_at) }
    it { should_not allow_mass_assignment_of(:created_at) }
    it { should_not allow_mass_assignment_of(:updated_at) }

    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end
end
