class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:image, :name, :introduction))
      flash[:notice] = "「#{@user.name}さん」の情報を更新しました"
      redirect_to :user
    else
      flash.now[:alert] = "自己紹介文を入力してください"
      render 'index'
    end
  end
end
