module TwitterPage

  class Profile < TwitterPage::MetaPage

    URL = "http://twitter.com"

    include TwitterPage::Navigation

    def locator(key, *options)
      hash = {
        "profile page header" => [:class => "profile-page-header"],
        "profile name"        => [:class => "profile-field"],
        "location"            => [:class => "location"],
      }
      hash.has_key?(key) ? hash[key] : defined?(super) ? super : raise("Locator [#{key}] does not exist in #{self.class.to_s}")
    end

    def is_loaded
      super
      @browser.div(*locator("profile page header")).span(*locator("profile name")).wait_until_present
    end

    def get_name(name)
      name.replace @browser.div(*locator("profile page header")).span(*locator("profile name")).text
      self
    end

    def get_location(location)
      location.replace @browser.div(*locator("profile page header")).span(*locator("location")).text.strip
      self
    end

  end

end
