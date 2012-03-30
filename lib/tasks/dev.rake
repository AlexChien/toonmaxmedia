namespace :dev do

  desc "Rebuild the system"
  task :build => ["tmp:clear", "log:clear", "db:reset", "db:setup"]

  desc "Generate fake data"
  task :fake => :environment do
    # TODO
  end

  desc "Run watchr"
  task :watchr do
    system("bundle exec watchr script/watchr.rb")
  end

  desc "import historical news"
  task :import_historical_news => :environment do
    base_path = "#{Rails.root}/public/xml"
    index_xml = Nokogiri::XML(open("#{base_path}/list-1.xml"))
    items = index_xml.xpath('//data/item').reverse.each do |item|
      id = item[:id]
      weight = item.xpath("weight").first.content
      news_xml = Nokogiri::XML(open("#{base_path}/#{id}.xml")).xpath("//data/item").first
      title = news_xml.xpath('title').first.content
      news_date = news_xml.xpath('newsdate').first.content
      content = news_xml.xpath('content').first.content

      NewsItem.create(:title => title, :news_date => news_date, :content => content, :weight => weight)
    end
  end

end