class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :image, :address, :price, :introduction, :user_id))
    @room.user_id = current_user.id # ログイン中のユーザーで投稿
    if @room.save
      flash[:notice] = "登録を実行しました"
      redirect_to :room
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
