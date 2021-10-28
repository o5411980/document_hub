require 'rails_helper'
describe 'departmentモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'name が空の場合' do
      it 'validationに引っかかる' do
        department = Department.new(
          {
            name: "",
            location: ['東京', '深圳', 'バンコク', 'デュッセルドルフ', 'ダラス', 'その他'].sample,
            description: Faker::Lorem.word
          }
        )
#        byebug
        expect(department).not_to be_valid
        department.destroy
      end
    end
    context 'location が空の場合' do
      it 'validationに引っかかる' do
        department = Department.new(
          {
            name: 'test',
            location: '',
            description: Faker::Lorem.word
          }
        )
#        byebug
        expect(department).not_to be_valid
        department.destroy
      end
    end
    context 'name,location が記載されている場合' do
      it 'validationに引っかかる' do
        department = Department.new(
          {
            name: 'test',
            location: ['東京', '深圳', 'バンコク', 'デュッセルドルフ', 'ダラス', 'その他'].sample,
            description: ''
          }
        )
#        byebug
        expect(department).to be_valid
        department.destroy
      end
    end
  end
end
