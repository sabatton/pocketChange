require 'test_helper'

class UserTest < ActiveSupport::TestCase
	#Relationshiop validations
	should have_many(:reviews)
	should have_many(:items)
	should have_many(:locations)

	#tests for name
	should validate_presence_of(:first_name)
	should validate_presence_of(:last_name)
	should validate_presence_of(:email)

	should validate_uniqueness_of(:email)

	# test active
	should allow_value(true).for(:active)
	should allow_value(false).for(:active)
	should_not allow_value(nil).for(:active)

	# tests for email
	should allow_value("fred@andrew.cmu.edu").for(:email)
	should allow_value("bhopkins@cmu.edu").for(:email)

	should_not allow_value("fred@fred.com").for(:email)
	should_not allow_value("my_fred@fred.org").for(:email)
	should_not allow_value("fred123@fred.gov").for(:email)
	should_not allow_value("my.fred@fred.net").for(:email)
	should_not allow_value("fred").for(:email)
	should_not allow_value("fred@fred,com").for(:email)
	should_not allow_value("fred@fred.uk").for(:email)
	should_not allow_value("my fred@fred.com").for(:email)
	should_not allow_value("fred@fred.con").for(:email)
	should_not allow_value(nil).for(:email)

	# tests for role
	should allow_value("Admin").for(:role)
	should allow_value("Member").for(:role)
	
	should_not allow_value("bad").for(:role)
	should_not allow_value("hacker").for(:role)
	should_not allow_value(10).for(:role)
	should_not allow_value("leader").for(:role)
	should_not allow_value(nil).for(:role)

	#tests for rating
	should allow_value(0).for(:rating)
	should allow_value(1).for(:rating)
	should allow_value(1.0).for(:rating)
	should allow_value(2.8).for(:rating)
	should allow_value(5).for(:rating)
	should allow_value(5.0).for(:rating)
	should allow_value(nil).for(:rating)

	should_not allow_value(-1).for(:rating)
	should_not allow_value(-98.0).for(:rating)
	should_not allow_value(6).for(:rating)
	should_not allow_value(1000).for(:rating)
end
