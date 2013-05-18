It took me some googling to figure that out, so I thought I should share.

Naked or root domain is the domain name striped from the 'www' like parts, similar to the domain for this website. Configuring a subdomain like the 'www' is straightfoward and you can easily get going following the Heroku [Custom Domains](https://devcenter.heroku.com/articles/custom-domains#custom-subdomains) article on the subject.

The problem with setting up the naked domain is that Heroku seems to have removed the instructions from its documentation. It also says that the only way to achieve a root domain pointing to a Heroku application is through a DNS host provider whith a CNAME like functionality at the apex level. It means that you can point the domain to another domain instead of its real IP address. You may read about it on Heroku's [The Limitations of DNS A-Records](https://devcenter.heroku.com/articles/apex-domains) article. Also, [here](http://serverfault.com/questions/408017/why-does-heroku-warn-against-naked-domain-names), an explanation about it and why you might not want to do that if you want your website to be really resilient.

Previously, the custom domain to a Heroku app used to be limited to only one for free, and it used to be a Heroku plugin. And it is not like that anymore, I don't know when it changed, but Heroku doesn't seem to have made much noise about it, except for the nice Dev Center article on the subject.

First configure your application to use the domain plugin, and add the domain name you want to use.

    heroku domains:add example.com

Now the missing part. Create the A records for Heroku's IP addresses. It should look like this.

    @ 75.101.163.44
    @ 75.101.145.87
    @ 174.129.212.2

***Done!***
