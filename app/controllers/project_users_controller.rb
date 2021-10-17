class ProjectUsersController < ApplicationController
  def create
    member = ProjectUser.create(project_users_params)
#    member = User.find(params[:user][1]).project_users.create(project_id: params[:user][4])
#    redirect_to projects_path, notice: "#{member.user.name}さんを#{member.project.name}に加えました"
    redirect_to project_path(member.project.id), notice: "#{member.user.name}さんを#{member.project.name}に加えました"
  end

  def destroy
    updated_project_id = ProjectUser.find(params[:id]).project_id
    ProjectUser.find(params[:id]).destroy
    # params[:id]で削除する membersテーブルのレコードがわかる。そこからどうやってdepartment_idとuser_idを読みだすか??
    redirect_to project_path(updated_project_id), notice: "メンバーを削除しました"
  end

  private
  def project_users_params
    params.require(:project_user).permit(:user_id, :project_id)
  end
end
