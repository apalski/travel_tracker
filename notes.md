
Traveller Tracker App:

* Has Users, Countries & Cities:

	* A user has many countries
	* A user has many cities through countries

	* A country belongs to a user
	* A country has many cities

	* A city belongs to a country

	* A user has a name, email and password
	* A country has a name and user_id
	* A city has a name and country_id
* A user must sign-up to the app
* A user must log-in to use the app
* A user must only be able to view and edit their own countries and cities
* A users input must be validated to prevent bad data
	* If a user leaves a field blank in an edit field it must not create a new entry for that field but leave the
	previous content untouched
	* A user cannot change the name of a country
* A user must signup with a name, email and password
* A user must login with a name and password

* Countries are chosen from a drop-down list of existing countries of the world
* Cities can be created by the user as some of these will be small little known towns


