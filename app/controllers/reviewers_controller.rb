class ReviewersController < ApplicationController
  def create
    reviewer = Reviewer.create(reviewer_params)
    redirect_to reviews_path, notice: "#{reviewer.user.name}さんをレビュー担当者にしました"
# 本当は下記のようにレビューのshow画面にリダイレクトしたいがエラー
#    redirect_to review_path(reviewer.review_id), notice: "#{reviewer.user.name}さんをレビュー担当者にしました"
  end

  def destroy
    Reviewer.find(params[:id]).destroy
    # 本当はreviewerを削除したreviewのshowページにリダイレクトしたいが、review_idをどうやって取得する？
    redirect_to reviews_path, notice: "削除しました"
  end

  private
  def reviewer_params
    params.require(:reviewer).permit(:user_id, :review_id)
  end


end
