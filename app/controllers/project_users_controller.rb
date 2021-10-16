class ProjectUsersController < ApplicationController
  def create
    member = User.find(params[:user][1]).project_users.create(project_id: params[:user][4])
    redirect_to project_path(params[:user][4]), notice: "#{member.user.name}さんを#{member.project.name}に加えました"
  end

  def destroy

  end
end
