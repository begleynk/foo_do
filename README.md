# FooDo

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


## Session 1 Notes 
**(24/2/15)**

#### What we did

We made the first two pages of the web app: one that shows all the current projects, and one that shows details of a single project. The project index page has a table with some basic details and links to the show project pages.

- Created a Projects controller with two actions
	- **index** 
		- Shows all projects in the database
		- GET /projects
	- **show**
		- Show details of a specific project
		- GET /projects/:id (eg. /projects/123)
- Created the Projects table in the database
	- We created the columns
		- name:string
		- note:text
		- due_date:datetime
	- And Rails added
		- id:integer
		- created_at:datetime
		- modified_at:datetime
	- We also added the #past_due_date? method to the Projects model
- We made the /project page funky
	- Moved the table row view details into the _project_row.html.erb partial
	
### Generating the model

Models can be created by using the Rails generators. This is how we created the project:

	rails g model Project name:string note:text due_date:datetime
	
Besides creating the Project model, Rails also created a migration to create the projects table in the database. You can find it in the db/migrations folder. To migrate the database run:

	rake db:migrate

Now your database should be ready to go. You can create some projects manually using the rails console:

	rails c # opens up an irb session, with the Rails environment loaded into it.
	
	p = Project.new
	p.name = "This is my project name"
	p.note = "This is a slightly longer project note."
	p.due_date = (DateTime.now + 3.days)
	
	p.save   # Saves the project into the database.
	
Now when you visit /projects, you should see the project you just created (assuming you have the controller and view setup)

