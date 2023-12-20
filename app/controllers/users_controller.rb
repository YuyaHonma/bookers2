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
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = "You have updated your profile successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
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