require 'rails_helper'
describe 'プロダクトモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'categoryが空の場合' do
      it 'validationに引っかかる' do
        product = Product.new(
          {
           category: '',
           description: 'テスト',
           status: ['開発中', '製造中', '製造中止'].sample,
           }
        )
#        byebug
        expect(product).not_to be_valid
        product.destroy
      end
    end
    context 'statusが空の場合' do
      it 'validationに引っかかる' do
        product = Product.new(
          {
           category: ['マウス', 'キーボード', 'バッテリー'].sample,
           description: 'テスト',
           status: '',
           }
        )
#        byebug
        expect(product).not_to be_valid
        product.destroy
      end
    end
    context 'category,statusが記載されている場合' do
      it 'validationを通過する' do
        product = Product.create(
          {
           category: ['マウス', 'キーボード', 'バッテリー'].sample,
           description: '',
           status: ['開発中', '製造中', '製造中止'].sample,
           }
        )
#        byebug
        expect(product).to be_valid
        product.destroy
      end
    end
  end
end
