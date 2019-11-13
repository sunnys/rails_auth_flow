## Running cybit-qr-backend

Running quo_sim rails require following steps

### Installing pre-requisite

To run cybit-qr-backend on your development machine make sure you have configured your rvm and you have install ruby-2.6.3, if not run following command to install ruby-2.6.3
```ruby
rvm install 2.6.3
```

after installing, make sure you are using it in your current shell session. To use it in your current shell session. Please enter following command.
```ruby
rvm use 2.6.3
```
One more pre-requisite is postgresql. Please make sure you have installed it and have a user in it.

### Cloning the repository
To clone the repository enter following command.
```
git clone http://starscribble.in:4000/sunnys/cybit-qr-backend.git
```

### Running the  API application.
After cloning the repository to run it you have to do following
1. ```bundle install```
2. Update the username and password in **database.yml** file to match the username and password in your machine.
3. ``` rails db:create ```
4. ``` rails db:migrate ```
5. ``` rails db:seed ``` This command will create the default user in your application. You can get the credentials in **seed.rb** file.
6. ``` rails s -b 0.0.0.0 ```

## Deploying this app on heroku

Install the Heroku CLI
Download and install the Heroku CLI.

If you haven't already, log in to your Heroku account and follow the prompts to create a new SSH public key.

```$ heroku login```

Create a new Git repository
Initialize a git repository in a new or existing directory

  ```
  $ cd my-project/
  $ git init
  $ heroku git:remote -a cybit-qr-backend
  ```

Deploy your application
Commit your code to the repository and deploy it to Heroku using Git.

  ```
  $ git add .
  $ git commit -am "make it better"
  $ git push heroku master
  ```

Existing Git repository
For existing repositories, simply add the heroku remote

  ```$ heroku git:remote -a cybit-qr-backend```