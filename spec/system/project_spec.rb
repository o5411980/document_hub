require 'rails_helper'

RSpec.describe '4,project CRUDのテスト', type: :system do
  before do
    Product.destroy_all
    @product = Product.create!(name: 'TEST', category: 'マウス', status: '開発中')
  end
  describe '4-1,projectの登録のテスト' do
    context 'プロジェクト作成画面で必要事項を記入すると、' do
      it "プロジェクトの新規登録ができること" do
        Project.destroy_all
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on 'プロジェクト一覧'
        sleep 0.1
        click_on '新規作成'
        sleep 0.1
        fill_in 'プロジェクト名', with: 'TEST'
        select "#{@product.name}", from: '担当製品'
        click_on '登録する'
        sleep 0.1
        expect(page).to have_content 'プロジェクトを作成しました。'
      end
    end
  end

  describe '4-2,projectの更新テスト' do
    before do
      Project.destroy_all
      Project.create!(name: 'TEST', product_id: "#{@product.id}")
    end
    context 'プロジェクト情報の編集画面で必要事項を記入すると、' do
      it "プロジェクト情報が更新できること。" do
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on 'プロジェクト一覧'
        sleep 0.1
        click_on '編集'
        sleep 0.1
        fill_in '概要', with: '更新テスト'
        click_on '更新する'
        sleep 0.1
        expect(page).to have_content 'プロジェクト情報を更新しました。'
      end
    end
  end

  describe '4-3,projectの削除テスト' do
    before do
      Project.destroy_all
      Project.create!(name: 'TEST', product_id: "#{@product.id}")
    end
    context 'プロジェクト一覧の画面で削除をクリックすると、' do
      it "該当プロジェクトが削除できること。" do
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on 'プロジェクト一覧'
        sleep 0.1
        click_on '削除'
        sleep 0.1
        expect(page.accept_confirm).to eq "本当に削除しますか？"
        sleep 0.1
        expect(page).to have_content 'プロジェクトを削除しました。'
      end
    end
  end
end
