class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def index
    @users = User.all
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books # ユーザーが投稿した本を取得
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated your profile successfully."
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
    user = User.find(params[:id])
    unless user.id == current_user.id
      flash[:alert] = "他のユーザーのプロフィールを編集する権限がありません。"
      redirect_to books_path
    end
  end
end
