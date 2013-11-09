require 'spec_helper'

describe Group do
  before do
     @user =FactoryGirl.create(:user)
     @group = Group.new(name: "Example group")
     @group.memberships.build(member_id: @user.id)
  end
  
  subject {@group}
  
  it { should respond_to(:name)}
  it { should respond_to(:memberships)}
  it { should respond_to(:description)}
  it "should destroy its memberships when destroyed" do
    memberships = @group.memberships.to_a
    @group.destroy
    expect(memberships).not_to be_empty
    memberships.each do |membership|
      expect(Membership.where(id: membership.id)).to be_empty
    end
  end
end
