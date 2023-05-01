class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms.all
  end
  
  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room =Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room), notice: "施設情報を登録しました。"  
    else
      flash.now[:alert] = "施設情報を登録できませんでした。"
      render action: :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to rooms_path, notice: "施設情報を削除しました。"  
    else
      flash.now[:alert] = "施設の削除に失敗しました。"
      render action: :show
    end
  end

  private
    def room_params
      params.require(:room).permit(:room_title,:room_info,:room_price,:address,:room_image)
    end

end
