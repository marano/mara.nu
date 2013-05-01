class Controller < Sinatra::Base

  use Rack::GoogleAnalytics, :tracker => 'UA-40550953-1'

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

class Integer
  def to_month
    Date.new(2010, self, 1).strftime('%B')
  end

  def ordinal
    cardinal = self.abs
    digit = cardinal%10
    if (1..3).include?(digit) and not (11..13).include?(cardinal%100)
      self.to_s << %w{st nd rd}[digit-1]
    else
      self.to_s << 'th'
    end
  end
end

class Rollin::Article
  def link_to_self
    "/article/#{id}"
  end
end
