# Live link : https://cryptoroulettepault.herokuapp.com/
* You should get a `r R14 (Memory quota exceeded)`when you do a search on the Heroku App. Since the site is not optimized.
* If you want to do a search, you should run it locally as followed:

* You need to `rails db:create`, `rails db:migrate`, `rails db:seed`
* Then run `rails console` and follow these steps:
* `a = StartScrap.new`, then `a.perform`, then `a.save` to seed your database with the Cryptos.
* Go to your `http://localhost:3000/`, enjoy!
