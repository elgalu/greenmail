# Squirrelmail with Greenmail ERROR "Bad or malformed request"

[Also in StackOverflow](http://stackoverflow.com/questions/21471726/squirrelmail-with-greenmail-error-bad-or-malformed-request)

[Greenmail](http://www.icegreen.com/greenmail/) is a SMTP, POP3, IMAP mail mocking service ideal for mail testing to instead of a real mail server you have a stub that holds the mails for later confirmation.

[Squirrelmail](http://squirrelmail.org/about/) is a php based webmail interface that i intend to use to access greenmail but...

As soon as i try to open an email from squirrelmail i get:

> ERROR: Bad or malformed request.

> Query: FETCH 1 BODY[HEADER]

> Server responded: Expected:'(' found:'B' Command should be '<tag> UID <fetch-command>|<store-command>|<copy-command>|<search-command>'

That was squirrel 1.4.22, today i even tried installing svn trunk `squirrelmail-20140131_0200-SVN.devel.tar.gz` and got the exact same error.

Tried other webmail alternatives to squirrel but got similar error too except for [atmail trial](http://atmail.com/) which is the only webmail client that has been able to open greenmail's mails. Telnet works well but that's too poor for what i'm trying to do here.

So if atmail can do it there must be something to be done here on squirrelmail side or perhaps some configuration related to imap i'm missing here?

Note atmail was tested with the same php 5.3.10, apache2, ubuntu precise 64 stack that squirrelmail.

To reproduce the error i've setup [an open source Vagrant VM here](https://github.com/elgalu/greenmail)

