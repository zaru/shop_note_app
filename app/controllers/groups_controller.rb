class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

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

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
     if @group.update(name:params[:group][:name],profile:params[:group][:profile])
       binding.pry
       redirect_to group_path(@group)
     else
       render 'groups/edit'
     end
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end

  def invite
    @group = Group.find(params[:group_id])
    @group.group_members.create(user_id: params[:user_id])
    redirect_to request.referrer || root_url
  end

  def invite_reset
    @group = Group.find(params[:group_id])
    @group.group_members.find_by(user_id: params[:user_id]).destroy
    redirect_to request.referrer || root_url

  end

  def join
    @group = Group.find(params[:id])
    @group.group_members.find_by(params[:user_id]).update(activated:true)
    redirect_to chatroom_group_path
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.users
  end

  def chatroom
    @group = Group.find(params[:id])
    @group_feed = Note.where(group_id: @group.id)
    @members = @group.users.select(:name)
  end

  def request_list
    @user = User.find_by(id: current_user.id)
    @groups = @user.groups.where(params[:id])
    @group = @user.group_members
  end

  private

    def group_params
      params.permit(:name,:profile)
    end

    def join_params
      params.permit(:user_id)
    end

end
