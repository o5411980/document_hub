class ProjectUsersController < ApplicationController
  def create
    member = User.find(params[:user][1]).members.create(department_id: params[:user][4])
    redirect_to project_path(params[:user][1]), notice: "#{member.user.name}さんを#{member.project.name}プロジェクトに加えました"
  end

  def destroy

  end
end
