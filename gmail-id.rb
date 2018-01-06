require 'gmail'

day = Time.now
day_str = "#{day.year}/#{sprintf("%02d", day.month)}/#{sprintf("%02d",day.day)}"
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

gmail = Gmail.connect('GOOG_ID', 'GOOG_PASS')
gmail.deliver do
	to "ex@ex.com"
  #subject "日本語"
  subject "stock_price#{day_str}"
  text_part do
    #body "日本語"
    body mail_body
  end
end

gamil.logout

