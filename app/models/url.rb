class Url < ActiveRecord::Base
  after_create :init
  validates_presence_of :url
  validates_uniqueness_of :url

  def init
    self.hits = 0
    generate_shortcode

    self.save
  end

  def generate_shortcode
    # using base36 for now until I figure out base62
    self.shorturl = id.to_s(36)
  end

  def add_hit
    self.hits += 1
    self.save
  end
end