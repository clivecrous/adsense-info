require 'mechanize'
require 'hpricot'

module Adsense
  class Info

    def initialize( username, password )
      @username = username
      @password = password
      @agent = Mechanize::Mechanize.new
    end

    def login!
      page = @agent.get 'http://www.gmail.com'
      form = page.forms.first
      form.Email = @username
      form.Passwd = @password
      @agent.submit form
    end

    def today_so_far
      login!
      ( get('https://www.google.com/adsense/v3/m/home') / 'span[@class~=value]' ).first.inner_html
    end

    private

    def get( url )
      Hpricot(@agent.get( url ).body)
    end

  end
end
