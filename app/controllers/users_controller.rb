class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
    @books = @user.books # ユーザーが投稿した本を取得
  end

  def edit
    # is_matching_login_user # この行はbefore_actionで既に含まれているため不要です
    # @user = User.find(params[:id]) # この行はbefore_actionで既に含まれているため不要です
  end

  def update
    # is_matching_login_user # この行はbefore_actionで既に含まれているため不要です
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])

    unless @user
      flash[:alert] = "ユーザーが見つかりませんでした"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    unless @user.id == current_user.id
      flash[:alert] = "他のユーザーのプロフィールを編集する権限がありません。"
      redirect_to user_path(current_user.id) # ログインユーザーの詳細画面にリダイレクト
    end
  end
end
