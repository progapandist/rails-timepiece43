class WatchesController < ApplicationController
  def index
    @watches = Watch.all
  end

  def show
    @watch = Watch.find(params[:id])
  end

  def new
    @watch = Watch.new
  end

  def create
    if current_user.id == params[:user_id]
      @watch.new(watch_params)
      @watch.user = User.find(params[:user_id])
      if @watch.save
        redirect_to watch_path(@watch)
      else
        render :new
      end
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



  # create_table "watches", force: :cascade do |t|
  #   t.text     "description"
  #   t.decimal  "price"
  #   t.string   "name"
  #   t.boolean  "available"
  #   t.integer  "user_id"
