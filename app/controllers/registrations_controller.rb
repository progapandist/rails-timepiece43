class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.save
  end

  def update
    super
  end
end
