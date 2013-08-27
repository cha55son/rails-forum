README
============================

__rails-forum__ is a basic forum app I created to learn about Ruby on Rails. Hopefully others could use this as a starting place for a forum application.

### Developed On

* __Ruby__: 2.0.0
* __Rails__: 4.0
* __OS__: Centos 5/6, Mac OSX 10.8.4

### Required Gems

* [Devise](https://github.com/plataformatec/devise) (User management)
* [Bootstrap 3.0](http://getbootstrap.com)
* [Kaminari](https://github.com/amatsuda/kaminari) (Pagination)

### Getting Started

First you need to clone the project into place.

        git clone git@github.com:cha55son/rails-forum.git

Next use bundle to pull in all the required gems

        bundle install

Now you need to setup the database

        rake db:setup
        rake db:migrate

Be sure to copy the `development.rb.example` to `development.rb`

        cp environments/development.rb.example environments/development.rb
        vim environments/development.rb

Update the `development.rb` file to reflect the host and mail credentials for your site.
Now run the following command to start the server

        rails server # Starts on port 3000 use -p to change the port.
        
You may now connect to the site by visiting [http://localhost:3000](http://localhost:3000)

The first user to sign up on the site will be given __admin__ privileges and will be able to __promote__ other users to admin status.

#### Thats all there is to it. Thanks for reading.
