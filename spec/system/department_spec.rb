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
        sleep 0.1
        expect(page).to have_content '部署を作成しました。'
      end
    end
  end

  describe '2-2,departmentの更新テスト' do
    before do
      Department.destroy_all
      Department.create!(name: 'TEST', location: '東京')
    end
    context '部署情報の編集画面で必要事項を記入すると、' do
      it "部署情報が更新できること。" do
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on '部署一覧'
        sleep 0.1
        click_on '編集'
        sleep 0.1
        fill_in '部署の概要', with: '更新テスト'
        click_on '更新する'
        sleep 0.1
        expect(page).to have_content '部署情報を更新しました。'
      end
    end
  end

  describe '2-3,departmentの削除テスト' do
    before do
      Department.destroy_all
      Department.create!(name: 'TEST', location: '東京')
    end
    context '部署情報の編集画面で必要事項を記入すると、' do
      it "部署情報が更新できること。" do
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on '部署一覧'
        sleep 0.1
        click_on '削除'
        sleep 0.1
        expect(page.accept_confirm).to eq "本当に削除しますか？"
        sleep 0.1
        expect(page).to have_content '部署を削除しました。'
      end
    end
  end
end
