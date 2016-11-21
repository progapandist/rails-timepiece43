class WatchesController < ApplicationController
  def index
    @watches = Watch.all
  end

  # TODO: make it a proper method, fix routing to display watches of the user
  def user_watches
    @user = User.find(params[:user_id])
    @watches = @user.watches
  end

  def show
    @watch = Watch.find(params[:id])
  end
end
