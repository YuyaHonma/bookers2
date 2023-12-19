class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    @user = User.new
  end
  
    def show
  @user = User.find(params[:id])
  @books = @user.books # ユーザーが投稿した本を取得
end

def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  
end

def edit
  @user = User.find(params[:id])
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
end