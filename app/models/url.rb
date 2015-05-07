class Url < ActiveRecord::Base
  after_create :init

  def init
    self.hits = 0
    sanitize
    generate_shortcode

    self.save
  end

  def generate_shortcode
    # using base36 for now until I figure out base62
    self.shorturl = id.to_s(36)
  end

  def sanitize
    if !self.url.start_with?("http://")
      self.url = 'http://' + self.url
    end
  end

  def add_hit
    self.hits += 1
    self.save
  end
end