class MembershipsController < ApplicationController
  before_action :signed_in_user

  def create
    puts params
    @group = Group.find(params[:membership][:group_id])
    current_user.join!(@group)
  end

  def destroy
    @group = Group.find(params[:membership][:group_id])
    current_user.leave!(@group)
  end
end