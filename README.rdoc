== FooDo

Part of the KCL Tech Ruby Web Application workshop series. This project will be developed weekly, introducing new concepts weekly.

## Get up and running

After you've cloned this project, navigate to the project directory in your terminal/command prompt, then type the command:

	bundle install

This will install all the gems required to run the project.

After that you can start the server:

	rails server

(You can also just type "rails s" for short.)


Now when you go to localhost:3000 in your browser, you'll be able to access your app.

#### A note about RVM

I've added two files to the project directory: _.ruby-version_ and _.ruby-gemset_. These files will tell RVM to use Ruby 2.2.0, and to switch to a gemset called foo_do. It simply means that this project won't be conflicting with any other gems you may have installed on your system, since RVM will now isolate foo_do.

You can read more about RVM workflows and best practices [here](https://rvm.io/workflow/projects).