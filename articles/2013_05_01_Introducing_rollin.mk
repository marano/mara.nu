![rollin](/images/rollin_shirt.jpg)

## Yet another Ruby blog

I recently moved to China, and the past three days was a big holiday here. My Chinese is still pretty bad and it kinda of limits my, let's say, entertainment options. And that's why I ended up studying Javascript frameworks in order to do a presentation at the office. After jumping from blog to blog I've gathered some amount of data around this topic in a big markdown file. And then I thought - wouldn't it be great if could publish it on blog? I have a bunch of stuff I want to post about and now seemed a perfect time to start it. So let's stop talking about me.

So I went after blogging engines. If you ask me why I didn't scaffold it with Rails I'm gonna blow your head. My requirements were that it needed to be easy to style so I could make it look pretty, that it was filesystem based so I could manage it with git, and that it was markdown. [The Ruby Toolbox](https://www.ruby-toolbox.com/) has listed a bunch of Ruby engines in it's [Blog Engine](https://www.ruby-toolbox.com/categories/Blog_Engines), no wonder! And couldn't find much more than that at the webz. 

I won't go in detail in any of them. But it is worth mention in case you want to learn more about it. [Jekyll](http://jekyllrb.com/) is great, but I didn't want to setup all the necessary infrastructure. [Octopress](http://octopress.org/), which is build on top of Jekyll, looks pretty cool! But it does too much stuff and I might have to hack it too much so it worked the way I wanted. [Toto](http://cloudhead.io/toto) was the best alternative. I also tried [Serious](https://github.com/colszowka/serious), which wasn't customizable out of the box, actually none were. Yes! I know there are some really nice blogging tools in Javascript, I was specially interested in [wheat](https://github.com/creationix/wheat). But in the end I just wanted to build my own website and wanted something to handle the posts for me. I wanted a blog library, not an engine.

So I started building the website with Sinatra (yes! it still take less lines than any Javascript framework) and eventually ported out the engine to a gem. And [rollin](http://github.com/marano/rollin) was born!

## rollin

Rollin is a Ruby blog library. It renders your articles, provides search and archiving. Files are read from the filesystem in the Markdown format. Current list of features:

  * Loads articles from a defined filesystem structure.
  * Renders articles in the markdown format.
  * Allows article specification with metatags similar to Jekyll's yaml front matter.
  * Search articles by date.
  * Search articles by metatags.
  * Provides archiving by year and monthly.

You can read the full documentation at the [rollin github page](https://github.com/marano/rollin).

### Future

For the future it would be nice to have it working with any markup languages. Also having the ability to setup other sources like a git repository, google docs account, or dropbox could make it appealing for some people.
