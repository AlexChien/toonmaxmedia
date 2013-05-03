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

  desc "cp un-ided ckeditor picture files to ided sub folders"
  task :move_unided_picstures_to_ided_sub_folders => :environment do
    Ckeditor::Picture.move_files_to_ided_fs
  end

end

namespace :dict do
  desc "generate database dictionary"
  task :generate_db_dict => :environment do
    I18n.t(:foo)
    ar = I18n.backend.send(:translations)[:"zh-CN"][:activerecord]

    models = ar[:models].inject({}){ |memo, (k,v)| memo[k.to_s] = v; memo }.sort
    fields = ar[:attributes]
    puts "数据表"
    models.each do |model|
      key = model.first
      value = model.last
      table_name = key.to_s.classify.tableize.gsub("/","_")
      puts "#{table_name}\t#{value}"
      puts "----------"
      columns = fields[key.to_sym]
      columns.each do |k,v|
        puts "#{k.to_s}\t#{v}"
      end
      puts ""
    end

    puts "schema_migrations\t数据库迁移版本历史"
    puts "----------"
    puts "version\t版本名"
    puts ""

    puts "rails_admin_histories\t管理后台操作历史"
    puts "----------"
    puts "message\t操作消息"
    puts "username\t用户名"
    puts "item\t操作对象id"
    puts "table\t操作表名"
    puts "month\t月"
    puts "year\t年"
    puts ""

    puts "总共#{models.size+2}个数据表"
  end
end