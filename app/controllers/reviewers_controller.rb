class ReviewersController < ApplicationController
  def create
    reviewer = User.find(params[:user][1]).reviewers.create(review_id: params[:user][4])
    redirect_to review_path(params[:user][4]), notice: "#{reviewer.user.name}さんをレビュー担当者にしました"
  end

  def destroy

  end
end
