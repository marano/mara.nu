class Controller < Sinatra::Base

  if ENV['RACK_ENV'] == 'production'
    use Rack::GoogleAnalytics, :tracker => 'UA-40550953-1'
  end

  register Sinatra::AssetPack

  assets {
    Less.paths << 'css'
    Less.paths << 'css/bootstrap'

    serve '/css', from: 'css'
    serve '/js', from: 'js'
    serve '/images', from: 'images'

    css :application, '/css/application.css', [
      '/css/bootstrap/bootstrap.css',
      '/css/my.css',
      '/js/highlight.js/styles/tomorrow.css'
    ]
    
    js :application, '/js/application.js', [
      '/js/highlight.js/highlight.pack.js'
    ]

    prebuild true
    js_compression  :jsmin
    css_compression :simple
  }

  def blog
    Rollin::Blog.new(articles_folder: 'articles')
  end

  get '/' do
    @articles = blog.articles

    @description = 'Thiago Marano blog'
    articles_keywords = @articles.map(&:title).join(' ').split(' ').join(', ')
    @keywords = "Thiago Marano, Thiago, Marano, blog, #{articles_keywords}"

    slim :home
  end

  get '/:year/:month/:day/:title' do
    year = params[:year]
    month = params[:month]
    day = params[:day]

    @article = blog.article("#{year}_#{month}_#{day}_#{params[:title]}")

    @description = @article.title
    @keywords = @article.title.split(' ').join(', ')

    slim :article
  end

  get '/about' do
    slim :about
  end

  get '/rss.xml' do
    @articles = blog.articles
    builder :rss
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
  def relative_link_to_self
    formatted_month = "%02d" % month
    formatted_day = "%02d" % day
    "/#{year}/#{formatted_month}/#{formatted_day}/#{id[11..(id.length - 1)]}"
  end

  def link_to_self
    "http://mara.nu/#{relative_link_to_self}"
  end
end
