class StaticPagesController < ApplicationController

  def login
    if signed_in?
      redirect_to dashboard_path
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def dashboard
  end

  def settings
  end

end
