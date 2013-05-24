module TwitterPage

  module Navigation

    def locator(key, *options)
      hash = {
        "search field" => [:id => "search-query"],
      }
      hash.has_key?(key) ? hash[key] : defined?(super) ? super : raise("Locator [#{key}] does not exist in #{self.class.to_s}")
    end

    def search_query(query)
      @browser.text_field(*locator("search field")).set query
      @browser.text_field(*locator("search field")).send_keys :enter
      TwitterPage::SearchResults.new @browser
    end

  end

end