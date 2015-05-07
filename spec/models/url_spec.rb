require 'rails_helper'

describe Url do
  it "has a valid factory" do
    expect(FactoryGirl.create(:url)).to be_valid
  end

  it "is invalid without a URL" do
    expect(FactoryGirl.build(:url, url: nil)).to_not be_valid
  end

  it "is valid with a URL" do
    expect(FactoryGirl.build(:url, url: "http://www.google.com")).to be_valid
  end

  it "is initialized with 0 hits" do
    google = FactoryGirl.create(:url, url: "http://www.google.com")
    expect(google.hits).to eq(0)
    
  end

  it "generates a shortcode on initialization" do
    google = FactoryGirl.create(:url, url: "http://www.google.com")
    expect(google.shorturl).to_not be_nil
  end

  it "generates a shortcode equal to the base36 encoding of the ID" do
    google = FactoryGirl.create(:url, url: "http://www.google.com")
    expect(google.shorturl).to eq(google.id.to_s(36))
  end

end