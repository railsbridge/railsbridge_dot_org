require 'spec_helper'

describe User do
  before { @user = create(:user) }

  it { should allow_mass_assignment_of(:first_name) }
  it { should allow_mass_assignment_of(:last_name) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }
  it { should allow_mass_assignment_of(:remember_me) }
  it { should_not allow_mass_assignment_of(:admin) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) } # devise adds this

  it "accepts valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      build(:user, email: address).should be_valid
    end
  end

  it "rejects invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      build(:user, email: address).should_not be_valid
    end
  end

  it "rejects duplicate email addresses" do
    user_one = create(:user, email: 'new_user@example.com')
    user_two = build(:user, email: 'new_user@example.com')
    user_two.should_not be_valid
  end

  it "rejects duplicate email addresses regardless of case differences" do
    user_one = create(:user, email: 'new_user@example.com'.upcase)
    user_two = build(:user, email: 'new_user@example.com')
    user_two.should_not be_valid
  end

  describe "password validations" do

    it "should require a password" do
      user = build(:user, password: '', password_confirmation: '')
      user.should_not be_valid
    end

    it "should require a matching password confirmation" do
      user = build(:user, password: 'password', password_confirmation: 'invalid_confirmation')
      user.should_not be_valid
    end

    it "should reject short passwords" do
      too_short_password = "a" * 5
      user = build(:user, password: too_short_password, password_confirmation: too_short_password)
      user.should_not be_valid
    end

  end

  describe "password encryption" do

    it "should have an encrypted password attribute" do
      user = build(:user)
      user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      user = build(:user)
      user.encrypted_password.should_not be_blank
    end

  end

end
