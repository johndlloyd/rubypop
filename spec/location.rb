require 'spec_helper'

describe "Twitter" do

  before :each do
    @page = TwitterPage::MetaPage.new browser
  end

  after :each do
    if example.exception != nil
      subject    = "#{example.full_description} [#{Time.now.to_i}]"
      url        = ""
      screenshot = ""
      @page.url(url).screenshot(screenshot)
      send_email email, :subject => subject, :body => email_body(example, url, @page.stack), :file => screenshot, :filename => "#{subject}.png"
    end
    @page.close
  end

  it "shows the location Brooklyn, NY for @brokenthumbs" do
    location = ""
    @page.open(TwitterPage::Profile, "/brokenthumbs")
         .get_location(location)
    expect(location).to eq("Brooklyn, NY")
  end
  
  it "shows the location New York for @renttherunway" do
    location = ""
    @page.open(TwitterPage::Profile, "/renttherunway")
         .get_location(location)
    expect(location).to eq("New York")
  end
  
  it "shows no location for @behance" do
    location = ""
    @page.open(TwitterPage::Profile, "/behance")
         .get_location(location)
    expect(location).to eq("")
  end
  
  it "shows the location Boston, MA for @seleniumconf" do
    location = ""
    @page.open(TwitterPage::Profile, "/seleniumconf")
         .get_location(location)
    expect(location).to eq("Boston, MA")
  end
  
  it "shows the location NYC for @nycselenium" do
    location = ""
    @page.open(TwitterPage::Profile, "/nycselenium")
         .get_location(location)
    expect(location).to eq("NYC")
  end
  
end