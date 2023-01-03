class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def profile
    if params.has_key?(:id)
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
end
