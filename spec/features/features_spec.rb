require_relative '../spec_helper.rb'

describe 'url shortening', :type => :feature, js: true do
  it 'can input a URL and receive a shortened one' do
    visit '/'
    fill_in("url[url]", :with => "www.google.com")
    click_button('shorten URL')
    expect(page).to have_content('URL shortened!')
  end
end