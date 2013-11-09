class MembershipsController < ApplicationController
  before_action :signed_in_user

  def create
    puts 'group next'
    puts @group = Group.find(params[:membership][:group_id])
    puts '@group'
    puts @group
    #Membership.new(member_id: current_user.id, group_id: @group.id)
    current_user.join!(@group)
  end

  def destroy
    @group = Group.find(params[:membership][:group_id])
    current_user.leave!(@group)
  end
end