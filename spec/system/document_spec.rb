require 'rails_helper'

RSpec.describe '5,document CRUDのテスト', type: :system do
  before do
    Product.destroy_all
    @product = Product.create!(name: 'TEST', category: 'マウス', status: '開発中')
    User.destroy_all
    @user = User.create!(name: 'test01', email: 'test01@example.com', password: 'test01')
  end
  describe '5-1,documentの登録のテスト' do
    context '文書作成画面で必要事項を記入すると、' do
      it "文書の新規登録ができること" do
        Document.destroy_all
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on '文書一覧'
        sleep 0.1
        click_on '新規登録'
        sleep 0.1
        fill_in '文書タイトル', with: 'TEST'
        select "#{@product.name}", from: '対象製品'
        select 'その他文書', from: '文書タイプ'
        click_on '登録する'
        sleep 0.1
        expect(page).to have_content '登録'
      end
    end
  end

  describe '5-2,documentの更新テスト' do
    before do
      Document.destroy_all
      Document.create!(title: 'TEST', user_id: "#{@user.id}", category: 'その他文書', product_id: "#{@product.id}", authorize: '未承認')
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
        fill_in '概要', with: '更新テスト'
        click_on '更新する'
        sleep 0.1
        expect(page).to have_content '製品情報を更新しました。'
      end
    end
  end

  describe '5-3,documentの削除テスト' do
    before do
      Document.destroy_all
      Document.create!(title: 'TEST', user_id: "#{@user.id}", category: 'その他文書', product_id: "#{@product.id}", authorize: '未承認')
    end
    context '文書一覧の画面で削除をクリックすると、' do
      it "該当文書が削除できること。" do
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on '文書一覧'
        sleep 0.1
        click_on '削除'
        sleep 0.1
        expect(page.accept_confirm).to eq "本当に削除しますか？"
        sleep 0.1
        expect(page).to have_content '文書を削除しました。'
      end
    end
  end
end
