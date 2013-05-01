class Controller < Sinatra::Base

  register Sinatra::AssetPack

  assets {
    Less.paths << 'views/style/bootstrap'

    serve '/style', from: 'views/style'

    css :application, '/style/application.css', [
      '/style/bootstrap/bootstrap.css'
    ]

    prebuild true
    css_compression :less
  }


  get '/' do
    @articles = Rollin::Blog.new.articles
    slim :home
  end
end
