module TwitterPage

  class Profile < TwitterPage::MetaPage

    URL = "http://twitter.com"

    include TwitterPage::Navigation

    def locator(key, *options)
      hash = {
        "profile page header" => [:class => "profile-page-header"],
        "profile name"        => [:class => "profile-field"],
      }
      hash.has_key?(key) ? hash[key] : defined?(super) ? super : raise("Locator [#{key}] does not exist in #{self.class.to_s}")
    end

    def get_name(name)
      name.replace @browser.div(*locator("profile page header")).span(*locator("profile name")).text
      self
    end

  end

end
