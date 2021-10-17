class MembersController < ApplicationController
  def create
#    byebug
    member = Member.create(member_params)
    redirect_to department_path(member.department_id), notice: "#{member.user.name}さんを#{member.department.name}に加えました"
  end

  def destroy
    Member.find(params[:id]).destroy
    # params[:id]で削除する membersテーブルのレコードがわかる。そこからどうやってdepartment_idとuser_idを読みだすか??
    redirect_to departments_path, notice: "削除しました"
  end

  private
  def member_params
    params.require(:member).permit(:user_id, :department_id)
  end
end
