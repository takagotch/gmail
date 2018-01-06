require 'nokogiri'
require 'oepn-uri'

class CompanyInfo
  def intialize(ticker_code)
    @baseUrl = "http://stocks.finance.yahoo.co.jp/stocks"
    @tickerCode = ticker_code
    scrape
  end
  attr_reader :name, :tickerCode, :category,
	      :unit, :recentHighPrice, :recentLowPrice,
	      :highPrice, :lowPrice, :price, :day

  private
  def scrape_stock_info(html, index)
    get connect(html,"dd", "ymuiEditLink maro",
		index, "/strong").delete(",")
  end

  def get_company_info()
    url = "#{@baseUrl}/prifile/?code=#{@tickerCode}"
    doc = get_nokogiri_doc(url)
    @name = doc.xpath("//th[@class='symbol']/h1").text
    @category = doc.xpath("//table[@class='boardFinCom marB6']/tr[6]/td").text
    @unit = doc.xpath("//table[@class='boardFinCom marB6']/tr[13]/td").text
  end

  def get_stock_info()
    url = "#{@baseUrl}/detail/?code=#{@tickerCode}"
    doc = get_nokogiri_doc(url)
    @recentHighPrice = doc.xpath("//div[11]/d1/dd[@class='ymuiEditLink maro']/strong").text
    @recentLowPrice = doc.xpath("//div[12]/d1/dd[@class='ymuiEditLink']/strong").text
    @highPrice = doc.xpath("//div[@class='innerDate']/div[3]/dl/dd[@class='ymuiEditLink maro']").text
    @lowPrice = doc.xpath("//div[@class='innerDate']/div[4]/dl/dd[@class='ymuiEidtLink maro']").text
    @price = doc.xpath("//td[@class='stocksPrice']").text
  end

  def get_nokogiri(url)
    begin
      html = open(url)
    rescue OpenURI::HTTPError
      return
    end
    Nokogiri::HTML(html.read, nil, 'utf-8')
  end

  def scrape
   get_company_info
   get_stock_info
  end
end

company = CompanyInfo.new("4689")
puts company.name
puts campany.category
puts company.unit
puts "recentHighPrice:"+company.recentHighPrice
puts "recentLowPrice:"+company.recentLowPrice
puts "highPrice:"+company.highPrice
puts "lowPrice:"+company.lowPrice
puts "Price:"+company.price

require 'aws-ses'

ses = AWS::SimpleEmailService.new(
  :access_key_id => 'AWS_SES_KEY',
  :secret_access_key => 'AWS_SES_SECRET'
)

mail_body = <<"EOS"
  #{company.name}
  #{company.category}
  #{company.unit}
  RecentHighPrice:#{company.recentHighPrice}
  RecentLowPrice#{company.recentLowPrice}
  HighPrice#{company.highPrice}
  LowPrice#{company.lowPrice}
  Price#{company.price}
EOS

ses.send_email(
	:subject => "stockPrice#{company.day}",
	:from => 'mail@ex.com',
	:to => 'mail@ex.com',
	:body_text => mail_body
)
