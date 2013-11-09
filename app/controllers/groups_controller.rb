class GroupsController < ApplicationController
  def new
  end
  
  def index
    @groups = Group.all.paginate(page: params[:page])
  end
  
  def show
    @group=Group.find(params[:id])  
    @user=current_user
    @members=@group.members.paginate(page: params[:page])
  end
  
  def create
    @group=Group.new(group_params)
    if @group.save
      flash[:success] = "Welcome to your new group"
      redirect_to @group
    else
      render 'new'
    end
  end
  
  def new
    @group=Group.new
  end
  
  private

    def group_params
      params.require(:group).permit(:name, :description)
    end

end
