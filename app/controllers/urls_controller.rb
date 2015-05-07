class UrlsController < ApplicationController
  def index

  end

  def create
    @url = Url.create(url: params["url"]["url"])

    respond_to do |f|
      f.js { }
    end
  end

  def show
    binding.pry
  end
end
