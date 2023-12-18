# app/controllers/users_controller.rb
class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index]

  def index
    # ユーザー一覧を表示するためのコードを追加
  end
  
end
