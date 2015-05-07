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

danshortener will take a URL, add it to a database (running PostgreSQL) assign it a shortcode, and then display the URL with the shortcode. It will also keep track of the number of visit each shortcode link got, and display the Top 100 of them in a table on the home page.

danshortener is portable, and the shortcode URLs it yields change depending on the host it's running on.

The shortcode is actually just the URL's database row ID, encoded with [Base36](http://en.wikipedia.org/wiki/Base36). I like this for a few reasons:

- As it's just the encoded row ID, the shortcode length of URLs start small, and new ones increase only as more are added
- The URL shortcodes are made only of characters that URLs are compatible with
- And finally, Encoding to Base36 is simple to do

## Tests

Tests are ran with rspec with Factory Girl and Capybara - to run tests, navigate to the danshortener root in your terminal and just run `rspec`.

Currently, the tests check to see if a URL can be made and validated, and then Capybara is used to automate shortening a URL with a web browser.

## Challenges

Thinking of a method to generating the URL shortcodes was a challenge. I'd like to use Base62 to generate the shortcodes, but Ruby does not seem to have direct support for it without the use of another gem, so I opted for Base36 instead.

Getting Capybara to cooperate with actually verifying that the URL shortcode is displayed on the page is another challenge. While I can have it check to see if the URL is persisted in the Top 100 listing (which involves a page refresh), I had trouble with getting Capybara to stay working if it clicks a link that returns a JS response. I'm aware that you can set Capybara to expect it with `:js => true`, but that would cause Capybara to freeze for me - supposedly [this is a known bug](https://github.com/DatabaseCleaner/database_cleaner/issues/273#issuecomment-46062187).


## To do / Future tasks

- Use Base62 for URL encoding
- Get proper and complete Capybara testing working