class Controller < Sinatra::Base
  get '/' do
    @articles = Rollin.new.articles
    slim :home
  end
end
