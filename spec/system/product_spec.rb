require 'rails_helper'

RSpec.describe '3,product CRUDのテスト', type: :system do
  describe '3-1,productの登録のテスト' do
    context '製品作成画面で必要事項を記入すると、' do
      it "製品の新規登録ができること" do
        Product.destroy_all
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on '製品一覧'
        sleep 0.1
        click_on '新規作成'
        sleep 0.1
        fill_in '製品名称', with: 'TEST'
        select 'マウス', from: '製品タイプ'
        select '開発中', from: '現況'
        click_on '登録する'
        sleep 0.1
        expect(page).to have_content '製品を登録しました。'
      end
    end
  end

  describe '3-2,productの更新テスト' do
    before do
      Product.destroy_all
      Product.create!(name: 'TEST', category: 'マウス', status: '開発中')
    end
    context '製品情報の編集画面で必要事項を記入すると、' do
      it "製品情報が更新できること。" do
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on '製品一覧'
        sleep 0.1
        click_on '編集'
        sleep 0.1
        fill_in '製品概要', with: '更新テスト'
        click_on '更新する'
        sleep 0.1
        expect(page).to have_content '製品情報を更新しました。'
      end
    end
  end

  describe '3-3,productの削除テスト' do
    before do
      Product.destroy_all
      Product.create!(name: 'TEST', category: 'マウス', status: '開発中')
    end
    context '製品一覧の画面で削除をクリックすると、' do
      it "該当製品が削除できること。" do
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on '製品一覧'
        sleep 0.1
        click_on '削除'
        sleep 0.1
        expect(page.accept_confirm).to eq "本当に削除しますか？"
        sleep 0.1
        expect(page).to have_content '製品を削除しました。'
      end
    end
  end
end
