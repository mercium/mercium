require 'spec_helper'

describe Customer do

  describe 'database schema' do
    it { should have_db_column(:title).of_type(:string).with_options(:limit => 10) }
    it { should have_db_column(:first_name).of_type(:string).with_options(:limit => 40, :null => false) }
    it { should have_db_column(:last_name).of_type(:string).with_options(:limit => 50, :null => false) }
    it { should have_db_column(:email).of_type(:string).with_options(:null => false) }
    it { should have_db_column(:encrypted_password).of_type(:string).with_options(:limit => 128, :null => false) }
    it { should have_db_column(:password_salt).of_type(:string).with_options(:null => false) }
    it { should have_db_column(:confirmation_token).of_type(:string) }
    it { should have_db_column(:confirmed_at).of_type(:datetime) }
    it { should have_db_column(:confirmation_sent_at).of_type(:datetime) }
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

    it { should have_db_index(:confirmation_token).unique(true) }
    it { should have_db_index(:email).unique(true) }
    it { should have_db_index(:reset_password_token).unique(true) }
    it { should have_db_index(:unlock_token).unique(true) }
  end

  describe 'attributes' do
    it { should allow_mass_assignment_of(:title) }
    it { should allow_mass_assignment_of(:first_name) }
    it { should allow_mass_assignment_of(:last_name) }
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
    it { should allow_mass_assignment_of(:remember_me) }

    it { should_not allow_mass_assignment_of(:encrypted_password) }
    it { should_not allow_mass_assignment_of(:password_salt) }
    it { should_not allow_mass_assignment_of(:confirmation_token) }
    it { should_not allow_mass_assignment_of(:confirmed_at) }
    it { should_not allow_mass_assignment_of(:confirmation_sent_at) }
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

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'instance method' do
    describe 'formal_name' do
      describe 'when the customer has title' do
        it 'should return the title and full name by default' do
          Customer.new(:title => 'Mr', :first_name => 'Andrew', :last_name => 'White').formal_name.should == 'Mr Andrew White'
        end

        it 'should return the title and last name when passed :short => true' do
          Customer.new(:title => 'Mr', :first_name => 'Andrew', :last_name => 'White').formal_name(:short => true).should == 'Mr White'
        end
      end

      describe 'when customer does not have a title' do
        it 'should return the full name by default' do
          Customer.new(:first_name => 'Andrew', :last_name => 'White').formal_name.should == 'Andrew White'
        end

        it 'should return the initial and last name when passed :short => true' do
          Customer.new(:first_name => 'Andrew', :last_name => 'White').formal_name(:short => true).should == 'A White'
        end
      end
    end

    describe 'full_name' do
      it 'should return the full name' do
        Customer.new(:first_name => 'Andrew', :last_name => 'White').full_name.should == 'Andrew White'
      end
    end

    describe 'initial' do
      it 'should return the first letter of the first name' do
        Customer.new(:first_name => 'Andrew', :last_name => 'White').initial.should == 'A'
      end
    end

    describe 'name' do
      it 'should return the full name by default' do
        Customer.new(:first_name => 'Andrew', :last_name => 'White').name.should == 'Andrew White'
      end

      it 'should return the initial and last name when passed :short => true' do
        Customer.new(:first_name => 'Andrew', :last_name => 'White').name(:short => true).should == 'A White'
      end
    end

    describe 'short_name' do
      it 'should return the initial and last name' do
        Customer.new(:first_name => 'Andrew', :last_name => 'White').short_name.should == 'A White'
      end
    end
  end
end
