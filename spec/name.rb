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

  it "shows the name Dan Chan for @brokenthumbs" do
    name = ""
    @page.open(TwitterPage::Profile, "/brokenthumbs")
         .get_name(name)
    expect(name).to eq("Dan Chan")
  end

  it "shows the name Rent the Runway for @renttherunway" do
    name = ""
    @page.open(TwitterPage::Profile, "/renttherunway")
         .get_name(name)
    expect(name).to eq("Rent the Runway")
  end

  it "shows the name Behance for @behance" do
    name = ""
    @page.open(TwitterPage::Profile, "/behance")
         .get_name(name)
    expect(name).to eq("Behance")
  end

end