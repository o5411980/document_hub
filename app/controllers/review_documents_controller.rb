class ReviewDocumentsController < ApplicationController
  def create
    review_document = ReviewDocument.create(review_documents_params)
    redirect_to review_path(review_document.review.id), notice: "#{review_document.document.title}を審査対象に加えました"
  end

  def destroy
    updated_review_id = ReviewDocument.find(params[:id]).review_id
    ReviewDocument.find(params[:id]).destroy
    redirect_to review_path(updated_review_id), notice: "審査対象から除外しました"
  end

  private
  def review_documents_params
    params.require(:review_document).permit(:document_id, :review_id)
  end

end
