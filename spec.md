# Specifications for the Sinatra Assessment

Specs:
- [X] Use Sinatra to build the app
- [X] Use ActiveRecord for storing information in a database
- [X] Include more than one model class (list of model class names e.g. User, Post, Category)
	  Models are City, Country and User
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
	  A User has many countries and a Country has many cities	
- [X] Include user accounts 
	  Users must sign up to use the app and must be logged in to use the app
- [X] Ensure that users can't modify content created by other users
	  Users can neither view or modify countries or cities that don't belong to them
- [X] Include user input validations
	  User input is validated to ensure there are no duplicate cities or countries
	  User input is validated to ensure that a blank field does not create or edit cities, countries or user profile items
- [X] Display validation failures to user with error message (example form URL e.g. /posts/new)
	  Users receive a meaningful flash message to alert them to each issue
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message