require_relative '../spec_helper.rb'

describe 'url shortening', :type => :feature do
  it 'will add the URL to the top 100 list when shortening it' do
    visit '/'
    fill_in("url[url]", :with => "www.google.com")
    click_button('shorten URL')
    visit '/'
    expect(page).to have_content('www.google.com')
  end

end