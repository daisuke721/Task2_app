class RoomsController < ApplicationController



  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :image, :address, :price, :introduction, :user_id, :room_id))
    @room.user_id = current_user.id # ログイン中のユーザーで投稿
    if @room.save
      flash[:notice] = "登録を実行しました"
      redirect_to room_path(@room)
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def search
    if params[:address].present?
      @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
    elsif params[:keyword].present?
      @rooms = Room.where('name LIKE ? OR address LIKE ? OR introduction LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    else
      @rooms = Room.none
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "削除を実行しました"
    redirect_to :rooms
  end
end
