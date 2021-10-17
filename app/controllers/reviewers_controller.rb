class ReviewersController < ApplicationController
  def create
    reviewer = Reviewer.create(reviewer_params)
#    redirect_to reviews_path, notice: "#{reviewer.user.name}さんをレビュー担当者にしました"
    redirect_to review_path(reviewer.review.id), notice: "#{reviewer.user.name}さんをレビュー担当者にしました"
  end

  def destroy
    updated_review_id = Reviewer.find(params[:id]).review_id
    Reviewer.find(params[:id]).destroy
    # 本当はreviewerを削除したreviewのshowページにリダイレクトしたいが、review_idをどうやって取得する？
    redirect_to review_path(updated_review_id), notice: "レビュー担当者を削除しました"
  end

  private
  def reviewer_params
    params.require(:reviewer).permit(:user_id, :review_id)
  end


end
