require 'spec_helper'

describe Role do
  it "should not be valid if name is empty" do
    role = Role.new
    role.should_not be_valid
    role.errors.on(:name).should == ["Name must not be blank"]
  end

  it "should not be valid if permissions is empty" do
    role = Role.new
    role.should_not be_valid
    role.errors.on(:permissions).should == ["Please select at least one permission"]
  end

  it "should not be valid if a role name has been taken already" do
    Role.create({:name => "Unique", :permissions => [Permission::ADMIN]})
    role = Role.new({:name => "Unique", :permissions => [Permission::ADMIN]})
    role.should_not be_valid
    role.errors.on(:name).should == ["A role with that name already exists, please enter a different name"]
  end

  it "should create a valid role" do
    Role.new(:name => "some_role", :permissions => [Permission::ADMIN]).should be_valid
  end

end