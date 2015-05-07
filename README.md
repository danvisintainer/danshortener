# danshortener

## What is it? 
danshortener is a simple (emphasis on 'simple') URL shortener ran on Rails, designed to help better my knowledge of developing Rails apps. You can see it in action on [http://danshortener.herokuapp.com](http://danshortener.herokuapp.com)!

## Installing danshortener
danshortener can be deployed to Heroku (or a server running Dokku) - just clone and push it to the remote host of your choice.

After pushing it, run the database migrations:

```bash
rake db:migrate
```

If you're using Heroku, run:

```bash
heroku run rake db:migrate
```

## What does it do, exactly?
danshortener will take a URL, add it to a database (running PostgreSQL) assign it a shortcode, and then display the URL with the shortcode.

The shortcode is actually just the URL's database row ID, encoded with [Base36](http://en.wikipedia.org/wiki/Base36). I like this for a few reasons:

- As it's just the encoded row ID, the shortcode length of URLs start small, and new ones increase only as more are added
- The URL shortcodes are made only of characters that URLs are compatible with
- And finally, Encoding to Base36 is simple to do