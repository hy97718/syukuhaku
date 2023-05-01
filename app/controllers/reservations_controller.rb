class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = current_user.reservations
    @rooms = current_user.rooms.all
    if @reservations != current_user.reservations
      redirect_to reservations_path(current_user), alert: "不正なアクセスです"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
  end

  def new
    @reservation = Reservation.new
    @room = @reservation.room
    if @reservation.invalid?
      flash[:alert] = "入力内容が正しくありません。"
      redirect_to room_path(@reservation.room)
    end
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = @reservation.room
    @user_id = current_user.id
    @days = (@reservation.room_check_out - @reservation.room_check_in).to_i
    @price = @days * @room.room_price * @reservation.number_of_reserve
    @reservation.sum_of_price = @price
    if @reservation.invalid?
      flash[:alert] = "入力内容が正しくありません。"
      redirect_to room_path(@reservation.room)
    end
  end

  def create
    @reservation = Reservation.new(reserve_params)
    @room = @reservation.room
    @user_id = current_user.id
    @days = (@reservation.room_check_out - @reservation.room_check_in).to_i
    @price = @days * @room.room_price * @reservation.number_of_reserve
    @reservation.sum_of_price = @price
    if @reservation.save
      redirect_to reservations_path(current_user), notice: "予約が完了しました。"
    else
      flash.now[:alert] = "予約に失敗しました。最初からやり直してください"
      render "/"
    end
  end
  

  def edit
  end
  private
    def reservation_params
      params.permit(:room_check_in, :room_check_out, :number_of_reserve, :sum_of_price, :start_time, :user_id, :room_id)
    end
    def reserve_params
      params.require(:reservation).permit(:room_check_in, :room_check_out, :number_of_reserve, :sum_of_price, :start_time, :user_id, :room_id)
    end
end
