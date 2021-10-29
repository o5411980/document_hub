require 'rails_helper'

RSpec.describe '1, User CRUDのテスト', type: :system do
  describe '1-1,ユーザー登録のテスト' do
    context 'サインアップ画面で必要事項を記入すると、' do
      it "ユーザーの新規登録ができること" do
        User.destroy_all
        visit root_path
        click_on '新規登録'
        fill_in '名前', with: 'test01'
        fill_in 'メールアドレス', with: 'test01@example.com'
        fill_in 'パスワード', with: 'test01'
        fill_in 'パスワード再入力', with: 'test01'
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end

  describe '1-2,セッション機能のテスト' do
    before do
      User.destroy_all
      User.create!(name: 'test01', email: 'test01@example.com', password: 'test01', admin: false)
    end
    context 'ログイン画面で必要事項を記入すると、' do
      it "ログインができること。" do
        visit root_path
        click_on 'ログイン'
        fill_in 'メールアドレス', with: 'test01@example.com'
        fill_in 'パスワード', with: 'test01'
#        click_on 'ログイン' #ambiguosエラー
        find(:xpath, '/html/body/div[2]/form/div[4]/input').click
        sleep 0.2
        expect(page).to have_content 'ログインしました。'
      end
    end
  end

  describe '1-3,プロフィール更新のテスト' do
    before do
      User.destroy_all
      User.create!(name: 'test01', email: 'test01@example.com', password: 'test01', admin: false)
    end
    context 'ユーザー自身のプロフィールの編集画面で情報を記入すると、' do
      it "自分のユーザー情報を更新できること。" do
        visit root_path
        click_on 'ログイン'
        fill_in 'メールアドレス', with: 'test01@example.com'
        fill_in 'パスワード', with: 'test01'
#        click_on 'ログイン' #ambiguosエラー
        find(:xpath, '/html/body/div[2]/form/div[4]/input').click
        sleep 0.2
        click_on 'プロフィール'
        sleep 0.2
        click_on '編集'
        sleep 0.2
#        byebug
        fill_in 'コメント', with: 'update'
        fill_in '現在のパスワード', with: 'test01'
        click_on '更新'
        sleep 0.2
        expect(page).to have_content 'アカウント情報を変更しました。'
      end
    end
  end

  describe '1-4,管理者機能のテスト' do
    context '管理者は、' do
      it "管理画面にアクセスできること" do
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.2
        visit rails_admin_path
        sleep 0.2
        expect(page).to have_content 'サイト管理'
      end
    end
  end

  describe '1-5,管理者機能のテスト' do
    before do
      User.destroy_all
      User.create!(name: 'test01', email: 'test01@example.com', password: 'test01', admin: false)
    end
    context '管理者は、管理画面から' do
      it "ユーザーを削除できること" do
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.2
        visit rails_admin_path
        sleep 0.2
        find(:xpath, '/html/body/div[3]/div/div[1]/ul[1]/li[4]/a').click
        sleep 0.2
#        byebug
        find(:xpath, '/html/body/div[3]/div/div[2]/div/div[2]/form[2]/table/tbody/tr[2]/td[9]/ul/li[3]/a').click
        sleep 0.2
        click_on '実行する'
        sleep 0.2
        expect(page).to have_content 'ユーザーの削除に成功しました'
      end
    end
  end
end
