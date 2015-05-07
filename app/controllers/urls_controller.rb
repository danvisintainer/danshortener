class UrlsController < ApplicationController
  def index
    @top100 = Url.order(hits: :desc).limit(100)
  end

  def create
    @url = Url.find_or_create_by(url: sanitize(params["url"]["url"]))

    respond_to do |f|
      f.js { }
    end
  end

  def show
    destination = Url.find_by(shorturl: params["shorturl"])
    if destination.nil?
      redirect_to root_path, :flash => { :error => "oops, that shortcode hasn't been made yet! try another one." }
    else
      destination.add_hit 
      redirect_to destination.url
    end
  end

  def sanitize(url)
    unless url.start_with?("http://") || url.start_with?("https://")
      url = 'http://' + url
    end

    url
  end

end
