## Yet another Ruby blog

I recently moved to China, and the past three days was a big holiday here. My Chinese is still pretty bad and it kinda of limits my, let's say, entertainment options. And that's why I ended up studying Javascript frameworks in order to do a presentation at the office. After jumping from blog to blog I've gathered some amount of data around this topic in a big markdown file. And then I thought - wouldn't it be great if could publish it on blog? I have several stuff that I want to post about and now seemed a perfect time to start it. So let's stop talking about me.

So I went after blogging engines. If you ask me why I didn't scaffold it with Rails I'm gonna blow your head. My requirements were that it needed to be easy to style so I could make it look pretty, that it was filesystem based so I could manage it with git, and that it was markdown. [The Ruby Toolbox](https://www.ruby-toolbox.com/) has listed a bunch of Ruby engines in it's [Blog Engine](https://www.ruby-toolbox.com/categories/Blog_Engines), no wonder! And couldn't find much more than that at the webz. 

I won't go in detail in any of them. But it is worth mention in case you want to learn more about it. [Jekyll](http://jekyllrb.com/) is great, but I didn't want to setup all the necessary infrastructure. [Octopress](http://octopress.org/), which is build on top of Jekyll, looks pretty cool! But it does too much stuff and I might have to hack it too much so it worked the way I wanted. [Toto](http://cloudhead.io/toto) was the best alternative. I also tried [Serious](https://github.com/colszowka/serious), which wasn't customizable out of the box, actually none were. Yes! I know there are some really nice blogging tools in Javascript, I was specially interested in [wheat](https://github.com/creationix/wheat). But in the end I just wanted to build my own website and wanted something to handle the posts for me. I wanted a blog library, not an engine.

So I started building the website with Sinatra (yes! it still take less lines than any Javascript framework) and eventually ported out the engine to a gem. And [rollin](http://github.com/marano/rollin) was born!

## rollin

Rollin is a Ruby blog library. It renders your articles and provides archiving. Files are read from the filesystem in the Markdown format.

This is how it works. Add `gem 'rollin'` to the project Gemfile. And write your articles with the following structure:

    ├── articles
        └── 2013_05_01_My_first_post.mk

And then you can use the this API to access your posts.

    blog = Rollin::Blog.new()
    
    first_post = blog.articles.first
    
    first_post.id     # => "2013_05_01_My_first_post"
    first_post.title  # => "My first post"
    first_post.body   # => "<h3>My first post!</h3>\n<p>blah blah blah</p>"

And monthly archive.

    may_archive = blog.monthly_archive.first
    
    may_archive.year      # => 2013
    may_archive.month     # => 5
    may_archive.articles  # => [ Rollin::Article(:title => "My first post" ...) ]

And annual archive.

    twenty_thirteen_archive = blog.annual_archive.first
    
    twenty_thirteen_archive.year                 # => 2013
    twenty_thirteen_archive.articles             # => [ Rollin::Article(:title => "My first post" ...) ]
    twenty_thirteen_archive.monthly_archive      # => [ Rollin::MonthArchive(:year => 2013, :month => 5 ...) ]


And this is how to you find a post.

    blog.find_article_by_id('2013_05_01_My_first_post')  # => #Rollin::Article(:title => "My first post" ...)

So you could have something like in your controller.

    get '/' do
      @articles = blog.articles
      @monthly_archive = blog.monthly_archive
      erb :home
    end

    get '/article/:article_id' do
      @article = blog.find_article_by_id(params[:article_id])
      erb :article
    end

You could make an archive sidebar with similar code.

    # home.erb

    <ul class='sidebar'>
      <% @monthly_archive.each do |month_archive| %>
        <li><%= month_archive.year >/<%= month_archive.month %></li>
      <% end %>
    </ul>

And have the post displayed with.

    <h2 class='title'><%= @article.title %></h2>
    <div class='content'><%= @article.body %></h2>

You can find a more detailed documentation at [github](http://github/com/marano/rollin).

### Concerns

Since it is meant to be used in a blogging domain it is not optimized with caching. You should implement cache in the infrastructure layer, what shouldn't be hard in a mostly static environment. I use the awesome Varnish, which also allows me to have several domains pointing to different applications running on the same server.

### Future

For the future it would be nice to have it working with any markup languages. Also having the ability to setup other sources like a git repository, google docs account, or dropbox could make it appealing for some people.
