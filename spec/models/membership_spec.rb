require 'spec_helper'

describe Membership do
  let(:group) { FactoryGirl.create(:group)}
  let(:member) { FactoryGirl.create(:user) }
  let(:membership) {group.memberships.build(member_id: member.id, group_id: group.id) }
  #let(:membership) {Membership.new(member_id: member.id, group_id: group.id)}
  subject { membership }
  
  it { should be_valid }
  
  describe "member methods" do
    it { should respond_to(:member) }
    its(:member) { should eq member }
  end
  
  describe "group and member should have each outher" do
    expect(group.members).to include(member)
    expect(member.joined_groups).to include(group)
  end
  
  describe "group methods" do
    it { should respond_to(:group) }
    its(:group) { should eq group }
  end
end
