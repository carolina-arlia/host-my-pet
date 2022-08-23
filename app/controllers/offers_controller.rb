class OffersController < ApplicationController

  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    @offer.save

    redirect_to offers_path
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params) # Will raise ActiveModel::ForbiddenAttributesError

    redirect_to offers_path
  end

  def destroy
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :location, :price_per_night)
  end

end
