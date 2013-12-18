require 'bundler'
Bundler.require

module Birthday
  class App < Sinatra::Application
  

    before do
      @date = Date.today.strftime("%m/%d")
      @birthday = "12/18"
      @christmas = "12/25"
    end
    
    get '/' do # birthday is default home page
      @image = "confetti" if @birthday == @date
          @date == @birthday ? @is_it_today = "YESSS" : @is_it_today = "NO"
      erb :index 
    end

    get '/:holiday' do
      case params[:holiday]
        when "birthday"
          @image = "confetti" if @birthday == @date
          @date == @birthday ? @is_it_today = "YESSS" : @is_it_today = "NO"
        when "christmas"
          @image = "snow" if @christmas == @date
          @date == @christmas ? @is_it_today = "YESSS" : @is_it_today = "NO"
        
      end
      erb :index  
    end

  end
end

