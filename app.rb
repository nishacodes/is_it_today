require 'bundler'
Bundler.require

module Birthday
  class App < Sinatra::Application
  

    before do
      @date = Date.today.strftime("%m/%d")
      @holiday_dates = {"birthday" => "10/27",
               "christmas" => "12/25",
               "halloween" => "10/31",
               "valentines" => "2/14"}
    end
    
    get '/' do # birthday is default home page
      @image = "confetti" if @birthday == @date
          @date == @birthday ? @is_it_today = "YESSS" : @is_it_today = "NO"
      erb :index 
    end

    get '/:holiday' do
      @holiday = params[:holiday]
      @image = "#{@holiday}" if @holiday_dates[@holiday] == @date
      @date == @holiday_dates[@holiday] ? @is_it_today = "YESSS" : @is_it_today = "NO"
      erb :index  
    end

    get '/:holiday/pretend' do
      @holiday = params[:holiday]
      @image = "#{@holiday}" 
      @is_it_today = "YESSS" 
      erb :index  
    end

    helpers do 
      def simple_partial(template)
        erb template
      end
    end
  end
end

