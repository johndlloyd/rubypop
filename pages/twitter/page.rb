module TwitterPage

  class MetaPage < PageObjects::MetaPage

    def initialize(browser)
      super browser
    end

    def is_loaded
      super
    end

  end

end