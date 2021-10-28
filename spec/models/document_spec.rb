require 'rails_helper'
describe 'ドキュメントモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    User.destroy_all
    Product.destroy_all
    user = User.create(name: 'test03', email: 'test03@example.com', password: 'test03')
    product = Product.create(
      {
       category: ['マウス', 'キーボード', 'バッテリー'].sample,
       description: '',
       status: ['開発中', '製造中', '製造中止'].sample,
       }
    )

    context 'title が空の場合' do
      it 'validationに引っかかる' do
#        byebug
        document = Document.new(
          {
            product_id: product.id,
            user_id: user.id,
            category: Document.categories.keys.sample,
            authorize: false,
            title: "",
            content: "test",
          }
        )
        expect(document).not_to be_valid
        document.destroy
      end
    end
    context 'category が空の場合' do
      it 'validationに引っかかる' do
#        byebug
        document = Document.new(
          {
            product_id: product.id,
            user_id: user.id,
            category: "",
            authorize: false,
            title: "test",
            content: "test",
          }
        )
        expect(document).not_to be_valid
        document.destroy
      end
    end
    context 'title,category が記載されている場合' do
      it 'validationに通過する' do
#        byebug
        document = Document.create(
          {
            product_id: product.id,
            user_id: user.id,
            category: Document.categories.keys.sample,
            authorize: false,
            title: "test",
            content: "test",
          }
        )
#        byebug
        expect(document).to be_valid
        document.destroy
      end
    end
  end
end
