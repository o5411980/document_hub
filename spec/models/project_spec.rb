require 'rails_helper'
describe 'project モデル機能', type: :model do
  describe 'バリデーションのテスト' do
    Product.destroy_all
    before do
      @product = Product.create(
          {
           category: ['マウス', 'キーボード', 'バッテリー'].sample,
           description: '',
           status: ['開発中', '製造中', '製造中止'].sample,
           }
        )
    end

    context 'name が空の場合' do
      it 'validationに引っかかる' do
#        byebug
        project = Project.new(
          {
            product_id: @product.id,
            name: '',
            description: "テストデータ",
          }
        )
        expect(project).not_to be_valid
        project.destroy
      end
    end
    context 'name が記載されている場合' do
      it 'validationを通過する' do
#        byebug
        project = Project.new(
          {
            product_id: @product.id,
            name: "#{@product.category}開発プロジェクト",
            description: "テストデータ",
          }
        )
        expect(project).to be_valid
        project.destroy
      end
    end
  end
end
