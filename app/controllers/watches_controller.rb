class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @watches = Watch.all
  end

  def show
    @watch = Watch.find(params[:id])

    # Map logic. Use plural to be consistent with Gmaps4rails handler functionality
    @map_markers = [{
      lat: @watch.latitude,
      lng: @watch.longitude,
    }]

  end

  def new
    @watch = Watch.new
    @user = current_user
  end

  def create
    @watch = Watch.new(watch_params)
    @user = current_user
    @watch.user = @user
    if @watch.save
      redirect_to watch_path(@watch)
    else
      render :new
    end
  end

  def edit
    @watch = Watch.find(params[:id])
    unless current_user == @watch.user
      redirect_to(@watch, alert: "You cannot edit this watch") and return
    end
  end

  def update
    @watch = Watch.find(params[:id])
    @watch.update(watch_params)
    if @watch.save
      redirect_to watch_path(@watch)
    else
      render :new
    end
  end

  private

  def watch_params
    params.require(:watch).permit(:price, :description, :name, :availability, :photo)
  end
end
