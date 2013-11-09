require "spec_helper"

describe "Group pages" do

    describe "Group index" do  
      before {visit groups_path}
      before {Group.create(name: "Example group")}
    
      subject { page }
     
      describe "it should have the title 'All groups'" do
        it{should have_title('groups')}
      end
    
      describe "it should display a group" do
        it {should have_link(Group.first.name, href: group_path(Group.first))}
      end
    end
    
    describe "group homepage" do
      before { Group.create(name: "Example group") }
      before {visit group_path(Group.first)}
      
      subject { page }
      
      describe "it should have the group name as a title" do
        it {should have_title(Group.first.name)}
      end
    end
end
