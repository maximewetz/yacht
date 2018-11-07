class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @boat = Boat.find(params[:boat_id])
    @user == current_user
    @reservation = Reservation.new

  end

  def edit
    @boat = Boat.find(params[:boat_id])
    @user = User.find(params[:user_id])
    @reservation = Reservation.find(params[:id])
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @user == current_user
    @reservation = Reservation.new(reservation_params)
    @reservation.boat.user = @reservation
    if @reservation.save
      redirect_to profile_reservation_path(reservations)
    else
      render :new
    end
  end

  def update
    @boat = Boat.find(params[:boat_id])
    @user == current_user
    @reservation = Reservation.update(reservation_params)
    @reservation.boat.user = @reservation
    if @reservation.update(reservation_params)
      redirect_to profile_reservations_path(reservations), notice: 'Reservation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @boat = Boat.find(params[:boat_id])
    @user == current_user
    @reservation = Reservation.update(reservation_params)
    @reservation.boat.user = @reservation
    @reservation.destroy
    redirect_to profile_path(profile), notice: 'Reservation was successfully destroyed.'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:booked_from, :booked_to, :boat_id, :user_id)
  end

end
