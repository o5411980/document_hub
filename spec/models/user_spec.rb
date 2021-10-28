require 'rails_helper'
describe 'ユーザーモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'nameが空の場合' do
      it 'validationに引っかかる' do
        user = User.new(name: '', email: 'test01@example.com', password: 'test01')
#        byebug
        expect(user).not_to be_valid
        user.destroy
      end
    end
    context 'name, email, passwordが記載されている場合' do
      it 'validationが通る' do
        user = User.new(name: 'test02', email: 'test02@example.com', password: 'test02')
#        byebug
        expect(user).to be_valid
        user.destroy
      end
    end
  end
end
