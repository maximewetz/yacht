class ReservationsController < ApplicationController

  def index
    @reservations = policy_scope(Reservation)
  end

  def show
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation_price = @reservation.boat.price
    @number_of_days = (@reservation.booked_from..@reservation.booked_to).count
    @total_price = @reservation_price * @number_of_days
  end

  def new
    @boat = Boat.find(params[:boat_id])
    @user = current_user
    @reservation = Reservation.new
    authorize @reservation
  end

  def edit
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @user = current_user
  end

  def create
    @boat             = Boat.find(params[:boat_id])
    @reservation      = Reservation.new(reservation_params)
    authorize @reservation
    @reservation.user = current_user
    @reservation.boat = @boat

      if @reservation.save
        @boat.save
        redirect_to user_reservation_path(current_user, @reservation)
      else
        render :new
      end
  end

  def update
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @user = current_user
    if @reservation.update(reservation_params)
      redirect_to user_reservations_path(current_user, @reservation)
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.destroy(reservation_params)
    redirect_to user_reservations_path(current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:booked_from, :booked_to, :boat_id, :user_id, :skipper)
  end
end
