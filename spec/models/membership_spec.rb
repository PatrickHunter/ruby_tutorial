require 'spec_helper'

describe Membership do
  let(:group) { FactoryGirl.create(:group)}
  let(:member) { FactoryGirl.create(:user) }
  let(:membership) {Membership.new(member_id: member.id, group_id: group.id)}
  #let(:membership) { member.memberships.build(group_id: group.id) }
  
  subject { membership }
  
  it { should be_valid }
  
  describe "member methods" do
    it { should respond_to(:member) }
    its(:member) { should eq member }
  end
  
  describe "group methods" do
    it { should respond_to(:group) }
    its(:group) { should eq group }
  end
end
