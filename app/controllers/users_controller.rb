class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    # index アクションの実装
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  private
  def set_user
    @user = User.find_by(id: params[:id])

    unless @user
      flash[:alert] = "User not found"
      redirect_to root_path
    end
  end
end