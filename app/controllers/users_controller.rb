class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    # @user は before_action でセットされるため、ここでは追加の処理は不要です
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end