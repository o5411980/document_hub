require 'rails_helper'
describe 'ドキュメントモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'title が空の場合' do
      it 'validationに引っかかる'
        document = Document.new(
          {
            product_id: 1,
            user_id: User.all.sample.id,
            category: element,
            authorize: false,
            title: "",
            content: "test",
          }
        )
        byebug
        expect(user).not_to be_valid
        user.destroy
    end
  end
end
