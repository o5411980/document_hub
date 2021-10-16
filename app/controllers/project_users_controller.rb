class ProjectUsersController < ApplicationController
  def create
    member = Project_user.create(member_params)
#    member = User.find(params[:user][1]).project_users.create(project_id: params[:user][4])
    redirect_to project_path(params[:user][4]), notice: "#{member.user.name}さんを#{member.project.name}に加えました"
  end

  def destroy
    byebug
    Project_user.find(params[:id]).destroy
    # params[:id]で削除する membersテーブルのレコードがわかる。そこからどうやってdepartment_idとuser_idを読みだすか??
    redirect_to departments_path, notice: "削除しました"
  end

  private
  def member_params
    params.require(:member).permit(:user_id, :department_id)
  end
end
