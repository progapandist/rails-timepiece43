class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @watches = Watch.where(hidden: false).first(8)
  end


end
