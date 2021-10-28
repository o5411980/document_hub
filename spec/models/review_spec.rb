require 'rails_helper'
describe 'review モデル機能', type: :model do
  describe 'バリデーションのテスト' do
    Product.destroy_all
    product = Product.create(
      {
       category: ['マウス', 'キーボード', 'バッテリー'].sample,
       description: '',
       status: ['開発中', '製造中', '製造中止'].sample,
       }
    )
    project = Project.create(
      {
        product_id: product.id,
        name: "#{product.category}開発プロジェクト",
        description: "テストデータ",
      }
    )

    context 'stage が空の場合' do
      it 'validationに引っかかる' do
#        byebug
        review = Review.new(
          {
            project_id: project.id,
            product_id: product.id,
            stage: '',
            description: 'test',
          }
        )
        expect(review).not_to be_valid
      end
    end
    context 'stage が記載されている場合' do
      it 'validationを通過する' do
#        byebug
        review = Review.create(
          {
            project_id: project.id,
            product_id: product.id,
            stage: Review.stages.keys.sample,
            description: 'test',
          }
        )
        expect(review).to be_valid
      end
    end
    context '開催日を過去日にすると' do
      it 'validationに引っかかる' do
#        byebug
        review = Review.new(
          {
            project_id: project.id,
            product_id: product.id,
            stage: 'Review 1',
            description: 'test',
            date_on: Date.yesterday
          }
        )
        expect(review).not_to be_valid
      end
    end
    context '開催日を未来にすると' do
      it 'validationを通過する' do
#        byebug
        review = Review.create(
          {
            project_id: project.id,
            product_id: product.id,
            stage: 'Review 1',
            description: 'test',
            date_on: Date.tomorrow
          }
        )
        expect(review).to be_valid
      end
    end
    context '期限を過去日にすると' do
      it 'validationに引っかかる' do
#        byebug
        review = Review.new(
          {
            project_id: project.id,
            product_id: product.id,
            stage: 'Review 1',
            description: 'test',
            deadline: Date.yesterday
          }
        )
        expect(review).not_to be_valid
      end
    end
    context '期限を未来にすると' do
      it 'validationを通過する' do
#        byebug
        review = Review.create(
          {
            project_id: project.id,
            product_id: product.id,
            stage: 'Review 1',
            description: 'test',
            deadline: Date.tomorrow
          }
        )
        expect(review).to be_valid
      end
    end
  end
end
