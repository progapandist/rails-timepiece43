class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    params[:search] = nil if params[:search] == ""
    if params[:search] == nil
      @watches = Watch.order(created_at: :desc).where(:hidden == false)
    elsif params[:search] != nil
       @watches = Watch.where("name ILIKE ?", "%#{params[:search]}%")
    end
  end

  def show
    if Watch.find(params[:id]).hidden == false
        @watch = Watch.find(params[:id])

      # Circle info for the map
      @map_circle = {
        lat: @watch.latitude,
        lng: @watch.longitude,
        radius: 500
      }
    end
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

  def hide
    @watch = Watch.find(params[:id])
    @watch.hidden = true
    @watch.save
    redirect_to :index
  end

  private

  def watch_params
    params.require(:watch).permit(:price, :description, :name, :availability, :photo, :location)
  end
end
