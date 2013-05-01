class Controller < Sinatra::Base
  get '/' do
    @articles = Rollin::Blog.new.articles
    slim :home
  end

  get '/*.css' do
    css_file = params[:splat].first
    directory = "views/#{File.dirname(css_file)}"
    less css_file.to_sym, :paths => [ directory ]
  end
end
