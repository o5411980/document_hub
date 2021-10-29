require 'rails_helper'

RSpec.describe '2,department CRUDのテスト', type: :system do
  describe '2-1,departmentの登録のテスト' do
    context '部署作成画面で必要事項を記入すると、' do
      it "部署の新規登録ができること" do
        Department.destroy_all
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on '部署一覧'
        sleep 0.1
        click_on '新規登録'
        sleep 0.1
        fill_in '部署の名称', with: 'TEST'
        select '東京', from: '所在地'
        click_on '登録する'
        expect(page).to have_content 'xxxx'
      end
    end
  end
end
