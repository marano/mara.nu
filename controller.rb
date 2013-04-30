class Controller < Sinatra::Base
  get '/' do
    @articles = Rollin::Blog.new.articles
    slim :home
  end
end
