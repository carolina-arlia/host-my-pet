class ReservationsController < ApplicationController
  before_action :set_offer, only: [:new, :create]

  def index
    @user = current_user.id
    @reservations = Reservation.where(user_id: @user)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.offer = @offer
    @reservation.user = current_user
    if @reservation.save
      redirect_to my_reservations_path
    else
      render 'offers/show', status: :unprocessable_entity
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to my_reservations_path
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    redirect_to my_reservations_path, status: :see_other
  end

  def confirm
    @reservation = Reservation.find(params[:id])
    @reservation.confirmed = true
  end

  def my_reservations
    index
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_checkin, :date_checkout, :guests, :confirmed)
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
