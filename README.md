### gmail
---
.rb
https://github.com/gmailgem/gmail
https://github.com/gmailgem/gmail/blob/master/lib/gmail.rb

.py
https://github.com/charlierguo/gmail

```sh
git clone git://github.com

sudo gem install gmail
git clone git:github.com/gmailgem/gmail.git
cd gmail
rake install
```


```py
import gmail
import gmail
g = gmail.login(username, password)

from gmail import Gmail

g = Gmail()
g.login(username, password)
g.logout()

g = gmail.login(username, password)
g.logged_in

gmail = gmail.authenticate(username, access_token)

g.inbox().mail()

g.inbox.mail()
g.mailbox().mail()
g.inbox().mail()
g.inbox().mail()

unread = g.inbox().mail(unread=True)
print unread[0].body

unread[0].fetch()
print unread[0].body

emails = g.inbox().mail(before=datetime.date(2013, 4, 18), sender="news@nbcnews.com")
for email in emails:
  email.read()
  email.archive()
  
emails = g.inbox().mail(sender="junkmail@gmail.com")
for email in emails:
  email.delete()
  
g.label("Faxes").mail()

email.add_label("Faxes")

for attachment in email.attachments:
  print 'Saving attachment: ' + attachment.name
  print 'Size' + str(attachment.size) + ' KB'
  attachment.save('attachments/' + attachment.name)

email.read()
email.unread()
email.spam()
email.star()
email.unstar()
```

```rb
require 'gmail'
gmail = Gmail.connect(username, password)
gmail.logout

Gmail.connect(username, password) do |gmail|
end

Gmail.connect!(username, password)
Gmail.connect!(username, password) {|gmail| ... play with gmail ... }

Gmail.connect(username, password) do |gmail|
  gmail.logged_in?
end

gmail = Gmail.connect(:xoauth, "email@domain.com",
  :token => 'TOKEN',
  :secret => 'TOKEN_SECRET',
  :consumer_key => 'CONSUMER_KEY',
  :consumer_secret => 'CONSUMER_SECRET'
)

gmail = Gmail.connect(:xoauth2, 'email@domain.com', 'ACCESS_TOKEN')

gmail = Gmail.connect(:xoauth2, "email@domain.com", "TOKEN")

gmail.inbox.count
gmail.inbox.count(:unread)
gmail.inbox.count(:read)

gmail.inbox.count(:after => Date.parse("2010-02-20"), :before => Date.parse("2010-03-20"))
gmail.inbox.count(:on => Date.parse("2010-02-20"))
gmail.inbox.count(:from => "myfriend@gmail.com")
gmail.inbox.count(:to => "directlytome@gmail.com")

gmail.inbox.count(:unread, :from => "myboxx@gmail.com")

gmail.mailbox('Urgent').count

gmail.inbox.emails(:unread, :before => Date.parse("2010-04-20"), :from => "myboxx@gmail.com")

gmail.inbox.emails(gm: '"testing"')

gmail.inbox.find(...)
gmail.inbox.search(...)
gmail.inbox.mails(...)

gmail.inbox.find(:unread).each do |email|
  email.read!
end

gmail.nobox.find(
  :after => Time.parse('2016-01-01 07:50:21'),
  :before => Time.parse('2016-04-05 21:55:05')
)

gmail.inbox.find(:before => Date.parse("2010-04-20"), :from => "news@nbcnews.com").each do |email|
  email.read!
  eamil.archive!
end

gmail.inbox.find(:from => "x-fiance@gmail.com").each do |email|
  email.delete!
end

folder = Dir.pwd
gamil.mailbox("Faxes").emails.each do |email|
  email.message.attachments.each do |f|
    File.write(File.join(folder, f.filename), f.body.decodeed)
  end
end

gmail.label("Fexes").emails.each {|email| ... }

email = gmail.inbox.find(:unread).first
attachment = email.attachments[0]
File.write(File.join(folder_path, attachment.filename), attachment.body.decoded)

email.label("Fexes")

email.lable!("Faxes")

email.move_to("Fexes")
email.move_to!("NewLabel")

email.read!
email.unread!
email.spam!
email.star!
email.unstar!

gmail.labels.all

gmail.labels.new("Urgent")
gmail.labels.add("AnotherOne")

gmail.labels.delete("Urgent")

gmail.labels.exists?("Urgent")
gmail.labels.exists?("AnotherOne")

gmail.labels.localize(:all)

gmail.deliver do
  to "email@example.com"
  subject "Having fun in Puerto Rico!"
  text_part do
    body "Text of plaintext message."
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Text of <em>html</em> message.</p>"
  end
  add_file "/path/to/some_image.jpg"
end

email = gmail.compose do
  to "email@example.com"
  subject "Having fun in Puerto Rico!"
  body "Spent the day on the road..."
end
email.deliver!
```

