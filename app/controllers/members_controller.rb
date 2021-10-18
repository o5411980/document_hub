class MembersController < ApplicationController
  def create
#    byebug
    member = Member.create(member_params)
    redirect_to department_path(member.department_id), notice: "#{member.user.name}さんを#{member.department.name}に加えました"
  end

  def destroy
    updated_department_id = Member.find(params[:id]).department_id
    Member.find(params[:id]).destroy
    redirect_to department_path(updated_department_id), notice: "メンバーを削除しました"
  end

  private
  def member_params
    params.require(:member).permit(:user_id, :department_id)
  end
end
