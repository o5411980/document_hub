require 'rails_helper'

RSpec.describe '6,review CRUDのテスト', type: :system do
  before do
    Product.destroy_all
    @product = Product.create!(name: 'TEST', category: 'マウス', status: '開発中')
    Project.destroy_all
    @project = Project.create!(name: 'TEST', product_id: "#{@product.id}")
  end
  describe '6-1,reviewの登録のテスト' do
    context 'レビュー作成画面で必要事項を記入すると、' do
      it "レビューの新規登録ができること" do
        Review.destroy_all
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on 'DR一覧'
        sleep 0.1
        click_on '新規登録'
        sleep 0.1
        select "#{@product.name}", from: '対象製品'
        select "#{@project.name}", from: '担当プロジェクト'
        select "Review 1", from: 'Review 1/2/3'
        find("#review_date_on_1i").find("option[value='2022']").select_option
        find("#review_deadline_1i").find("option[value='2022']").select_option
        click_on '登録する'
        sleep 0.1
        expect(page).to have_content 'レビューを作成しました。'
      end
    end
  end

  describe '6-2,reviewの更新テスト' do
    before do
      Review.destroy_all
      Review.create!(stage: 'Review 1', product_id: "#{@product.id}", project_id: "#{@project.id}", date_on: "#{Date.tomorrow}", deadline: "#{Date.tomorrow}")
    end
    context 'レビューの編集画面で必要事項を記入すると、' do
      it "レビュー情報が更新できること。" do
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on 'DR一覧'
        sleep 0.1
        click_on '編集'
        sleep 0.1
        fill_in '概要', with: '更新テスト'
        click_on '更新する'
        sleep 0.1
        expect(page).to have_content 'レビュー情報を更新しました。'
      end
    end
  end

  describe '6-3,レビューの削除テスト' do
    before do
      Review.destroy_all
      Review.create!(stage: 'Review 1', product_id: "#{@product.id}", project_id: "#{@project.id}", date_on: "#{Date.tomorrow}", deadline: "#{Date.tomorrow}")
    end
    context 'レビュー一覧の画面で削除をクリックすると、' do
      it "該当レビューが削除できること。" do
        visit root_path
        click_on 'ゲストログイン(管理者)'
        sleep 0.1
        click_on 'DR一覧'
        sleep 0.1
        click_on '削除'
        sleep 0.1
        expect(page.accept_confirm).to eq "本当に削除しますか？"
        sleep 0.1
        expect(page).to have_content 'レビューを削除しました。'
      end
    end
  end
end
