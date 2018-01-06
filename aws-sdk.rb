require 'aws-sdk'

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
