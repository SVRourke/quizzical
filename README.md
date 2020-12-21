# Quizzical

Quizzical is a Ruby on Rails app that allow users to create and take quizzes online.

## Getting Started

To get started simply clone the repository and follow the setup instructions below
#
### Setup

One you have cloned the repository cd into the folder and run bundle install, this will install the necessary gems. This project relies on [dotenv](https://github.com/bkeepers/dotenv) to manage environment variables, dotenv uses a file ".env" in the root directory of the app to declare environment variables. For obvious reasons I have not included my .env file in the repository so you will have to create one for yourself with your own information.  
&nbsp;  
### Step 1

This project relies on 3 environment variables SESSION_SECRET (used by the server to encrypt cookies), GOOGLE_CLIENT_ID, and GOOGLE_CLIENT_SECRET (used for authenticating users via google omniauth [zquests OmniAuth Google OAtuh2 Strategy](https://github.com/zquestz/omniauth-google-oauth2)). 

To easily generate the SESSION_SECRET open an interactive ruby shell and import the securerandom module and execute SecureRandom.hex(), then copy the generated key to your clipboard.
```
> require 'securerandom'
    => true
> SecureRandom.hex()
    => "7b880dd12d93822970d20f44cd2dfca3"
```
Now open your .env file and add replicate the following line using the key we generated in the previous step.
```
export SESSION_SECRET=7b880dd12d93822970d20f44cd2dfca3
```
<br>

### Step 2
The next step is to set our GOOGLE_CLIENT_ID, and GOOGLE_CLIENT_SECRET variables in the .env file. Generating the required credentials from the google api console is beyond the scope of this readme [Here is the google documentation ](https://developers.google.com/identity/protocols/oauth2)
for help with the google oauth2 gem consult the [documentation](https://github.com/zquestz/omniauth-google-oauth2) 
<br>
<br>
Once you have the credentials add them to the .env like the session_key
```
export GOOGLE_CLIENT_ID=your-client-id
export GOOGLE_CLIENT_SECRET=your-client-secret
```
Now the app will be able to contact google for authentication.

### Step 3

The final step is to create the database and run the migrations, to do so open a terminal and run the following:
```
rake db:create db:migrate
```
If you would like to seed the database with the sample data run the following command after the migrations are finished.
```
rake db:seed
```
To start the app run the following command and navigate to localhost:3000 in your browser.
```
rails s
```
<br>

## Built With

* [zrequestz/omniauth-google-oauth2](https://github.com/zquestz/omniauth-google-oauth2) - Google OAuth
* [varvet/pundit](https://github.com/varvet/pundit) - An easy to use authorization system
* [bkeepers/dotenv](https://github.com/bkeepers/dotenv) - Environment variable management for development.
* [rails/rails](https://github.com/rails/rails) - Web application framework.

## Contributing

I do not intend to continue development on this project, nor do I intend to make this into a product. If you would like to work on this project, fork it for yourself and go crazy. If you would like to create a product based on this project go ahead! and while you're at it drop me a line because I'd love to hear about it.

## Authors

* **Samuel Rourke** - *Developer* - [SVRourke](https://github.com/SVRourke)

## License

This project is licensed under the MIT License


