class GroupsController < ApplicationController

  def create
    @group = Group.new(group_params)
    @group.admin_user_id = current_user.id
    if @group.save
      @group.group_members.build(user_id: current_user.id).save
      flash[:success]= "グループを作成しました"
      redirect_to group_path(@group)
    else
      render 'groups/new'
　　 end
  end

  def invite
    binding.pry
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
    Group.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end

  def show
    @room = Group.find(params[:id])
    @notes = @room.notes
    @members = @room.users.select(:name)
  end

  private

    def group_params
      params.permit(:name,:profile)
    end


end
