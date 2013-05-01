class Controller < Sinatra::Base

  register Sinatra::AssetPack

  assets {
    Less.paths << 'views/style'
    Less.paths << 'views/style/bootstrap'

    serve '/style', from: 'views/style'

    css :application, '/style/application.css', [
      '/style/bootstrap/bootstrap.css',
      '/style/my.css'
    ]

    prebuild true
    css_compression :less
  }

  def blog
    Rollin::Blog.new(articles_folder: 'articles')
  end

  get '/' do
    @articles = blog.articles
    slim :home
  end

  get '/article/:id' do
    @article = blog.find_article_by_id(params[:id])
    slim :article
  end
end

class Rollin::Article
  def link_to_self
    "/article/#{id}"
  end
end
