class PagesController < ApplicationController

  def show
    render template: "pages/#{params[:page]}"
  end
  def home
  end
  def contact
  end
  def FAQ
  end
  def appointment
  end
end
