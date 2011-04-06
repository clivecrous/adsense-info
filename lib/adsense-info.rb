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
      if form
        form.Email = @username
        form.Passwd = @password
        @agent.submit form
      end
      nil
    end

    def update_values!
      login!
      values = ( get('https://www.google.com/adsense/v3/m/home') / 'span[@class~=value]' )
      @today_so_far = values[0].inner_html
      @yesterday = values[1].inner_html
      @this_month_so_far = values[2].inner_html
      @last_month = values[3].inner_html
    end

    def today_so_far
      update_values! unless @today_so_far
      @today_so_far
    end

    def yesterday
      update_values! unless @yesterday
      @yesterday
    end

    def this_month_so_far
      update_values! unless @this_month_so_far
      @this_month_so_far
    end

    def last_month
      update_values! unless @last_month
      @last_month
    end

    private

    def get( url )
      Hpricot(@agent.get( url ).body)
    end

  end
end
