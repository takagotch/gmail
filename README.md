### gmail
---
.rb
https://github.com/gmailgem/gmail
https://github.com/gmailgem/gmail/blob/master/lib/gmail.rb

.py
https://github.com/charlierguo/gmail

```sh
git clone git://github.com

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


```
```

