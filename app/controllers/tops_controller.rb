class TopsController < ApplicationController
skip_before_action :authenticate_user!
  def index
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest_admin@example.com') do |user|
#      user.id = User.all.count + 1
      user.name = 'guest_admin'
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
    end
#    user.members.create(department_id: 1)
    sign_in user
    redirect_to homes_path, notice: 'ゲストユーザーとしてログイン'
  end
end
