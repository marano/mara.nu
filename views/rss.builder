xml.instruct! :xml, :version => '1.0'
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "mara.nu"
    xml.description ""
    xml.link "http://mara.nu/"

    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.link article.link_to_self
        xml.description article.body
        xml.pubDate Time.parse(article.date.to_s).rfc822()
        xml.guid article.link_to_self
      end
    end
  end
end
