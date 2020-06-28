class GroupsController < ApplicationController

  def index
  end

  def new
  end

  def create

    @group = Group.new(group_params)

    @group.admin_user_id = current_user.id
    @group.save

  end

  def edit
    @group = Group.find(params[:id])
  end

  def update

    @group = Group.find(params[:id])
     if @group.update_attributes(group_params)
       redirect_to root_path
     else
       render 'groups/edit'
     end
  end

  def destroy
  end

  private

    def group_params
      params.permit(:name,:profile)
    end


end
