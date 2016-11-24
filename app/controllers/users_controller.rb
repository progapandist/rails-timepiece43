class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @user = User.find(params[:id])

    all_reviews = Review.all

    @reviews_as_a_user = []
    all_reviews.each do |review|
      if user_id(review) == params[:id].to_i
        @reviews_as_a_user << review
      end
    end

    @reviews_as_an_owner = []
    all_reviews.each do |review|
      if owner_id(review) == params[:id].to_i
        @reviews_as_an_owner << review
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to(@user, alert: "You cannot edit this user")
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar)
  end

  def user_id(review)
    review.booking.user.id
  end

  def owner_id(review)
    review.booking.watch.user.id
  end
end
