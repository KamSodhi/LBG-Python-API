# REST API starter

This application is the start point for Sprint 1 of the Lloyds Bank Group Modern Engineering Bootcamp Project Specification.

## Installation

To initialise the project you will need to install several dependencies, open up a git bash terminal from the repo directory and run the command:

~~~ bash
pip install -r requirements.txt
~~~

## Running the application

In order to run the application, from your git bash terminal run:

~~~ bash
python lbg.py
API Listening on http://localhost:8080
~~~

## Stopping the application

In order to stop the application from the git bash terminal that is running the server press ``CTRL`` + ``C``

## Functionality

### Through the browser

In order to interact with this application through a browser navigate to http://localhost:8080/index.html

There is a full CRUD functionality through the buttons on the web page.

### CREATE

To create the example product run the command:

~~~ bash
curl -s -X POST http://localhost:8080/create -H 'Content-type:application/json' -d '{"name":"example product", "description":"this is an example", "price":9.99}'
~~~

### READ (all)

To read all of the products run the command:

~~~ bash
curl -s -X GET http://localhost:8080/read
~~~

### READ (one)

To read one of the products run the command:

~~~ bash
curl -s -X GET http://localhost:8080/read/<id>
~~~

n.b: For these commands anything surrounded by angled braces <> needs to be replaced by you

### UPDATE

To update one of the products run the command:

~~~ bash
curl -s -X PUT http://localhost:8080/update/<id> -H 'Content-type:application/json'  -d '{"name":"updated product", "description":"its brand new", "price":99.99}'
~~~

n.b: For these commands anything surrounded by angled braces <> needs to be replaced by you

### DELETE

To delete one of the products run the command:

~~~ bash
curl -s -X DELETE http://localhost:8080/delete/<id>
~~~

n.b: For these commands anything surrounded by angled braces <> needs to be replaced by you

## Testing

To run unit/integration tests on this project, make sure the server is running.
In a new terminal window use the command

~~~ bash
python lbg.test.py
~~~

To run acceptance tests on this project, you must first download a webdriver for the browser of your choice and update the path in `.\features\environment.py`. Then make sure the server is running.
In a new terminal window use the command

~~~ bash
behave .\features\restapp.feature
~~~

### Example Tests

#### Unit 

There are unit tests included with this project, we are testing the item buiklder for the object that it returns.

````Python
def test_item_builder_data(self):
        """
        Test to see if item_builder returns the correctly keyed dictionary object
        based on raw data passed to it
        """
        expected = {'name': 'Tool', 'description': 'Hammer', 'price': 10.5, '_id': 99}
        self.assertEqual(item_builder("Tool", "Hammer", 10.50, 99), expected)
```

If we test the builder and input a name of "Tool", a description of "Hammer", a price of 10.5 and an _id of 99 we can expect an object to be created that matches this format.