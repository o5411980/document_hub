class TopsController < ApplicationController
skip_before_action :authenticate_user!
  def index
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.name = 'guest_admin'
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
    if user.members.count == 0
    user.members.create(department_id: 2)
    end
    sign_in user
    redirect_to homes_path, notice: '管理者ゲストユーザーとしてログイン'
  end

  def normal_guest_sign_in
    user = User.find_or_create_by!(email: 'guest_normal@example.com') do |user|
      user.name = 'guest_normal'
      user.password = SecureRandom.urlsafe_base64
      user.admin = false
    end
    if user.members.count == 0
      user.members.create(department_id: 1)
    end
    sign_in user
    redirect_to homes_path, notice: '一般ゲストユーザーとしてログイン'
  end

end
