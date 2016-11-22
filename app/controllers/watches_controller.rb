class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @watches = Watch.all
  end

  def show
    @watch = Watch.find(params[:id])
  end

  def new
    @watch = Watch.new
    @user = User.find(params[:user_id])
  end

  def create
    @watch = Watch.new(watch_params)
    @user = User.find(current_user.id)
    @watch.user = @user
    if @watch.save
      redirect_to user_watch_path(@user, @watch)
    else
      render :new
    end
  end

  def edit
    if current_user.id == params[:user_id]
      @watch.find(params[:watch_id])
    end
  end

  def update
    if current_user.id == params[:user_id]
      @watch.find(params[:watch_id])
      @watch.update_attributes(watch_params)
      if @watch.save
        redirect_to watch_path(@watch)
      else
        render :new
      end
    end
  end

  private

  def watch_params
    params.require(:watch).permit(:price, :description, :name, :availability, :photo)
  end
end
