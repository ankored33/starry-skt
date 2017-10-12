require 'sinatra'
require 'sinatra/reloader' if development?
require 'nokogiri'
require 'open-uri'

class StarrySky
  def initialize(skyname)
    @name = skyname
  end
  
  def dispName
    p @name
  end

  def quantity
    return 55
  end
end

class Partner
  def initialize(name)
    @name = name
  end

  def rss()
    rss = "http://b.hatena.ne.jp/#{@name}/rss"
  end
  
  def nokogiri()
    opt = {}
    opt["User-Agent"] = "Opera/9.80 (Windows NT 5.1; U; ja) Presto/2.7.62 Version/11.01 " #User-Agent偽装
    charset = nil
    xml = open(rss,opt) do |f|
      charset = f.charset #文字種別を取得
      f.read #htmlを読み込んで変数xmlに渡す
    end
    doc = Nokogiri::XML(xml)
    doc.remove_namespaces!
    titles = doc.search('title')
    p titles.text
  end
  
  def parse(doc)
  end
end


partner = Partner.new("barbieri")
partner.nokogiri

get "/" do
  test = StarrySky.new("test")
  @q = test.quantity
  erb :index

end


#起動オプションbundle exec ruby main.rb -p $PORT -o $IP