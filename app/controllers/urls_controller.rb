class UrlsController < ApplicationController
  def index
    @top100 = Url.order(hits: :desc).limit(100)
  end

  def create
    @url = Url.create(url: params["url"]["url"])

    respond_to do |f|
      f.js { }
    end
  end

  def show
    binding.pry
    destination = Url.find_by(shorturl: params["shorturl"])
    destination.add_hit 
    redirect_to destination.url
  end

end
