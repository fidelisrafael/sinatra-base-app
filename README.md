## Sinatra Base App

To start, simple clone this repository, move to cloned folder, and run:

`bundle install`	
`shotgun config.ru -p 4567`

---

## Changing ORM Drive

`app/bootstrap.rb` is where you define your current Active Record Driver, search for `APP_ORM_DRIVER` for change current database driver, you can use: `sqlite`, `postgres`, `mysql`, `...`
Remeber, to create a method in `app/bootstrap` following the rule:

`setup_database_` + `APP_ORM_DRIVER`

**Eg**:

If you're using `mysql` as database connection driver, your connection setup method must be the following:

```rb
APP_ORM_DRIVER = :mysql

def self.setup_database_mysql
    require 'sinatra/activerecord'
    
	ActiveRecord::Base.establish_connection(
      :adapter  => 'mysql',
      :host     => 'localhost',
      :username => 'dbuser',
      :password => 'm4k3u557r0n63r',
      :database => 'myawesomeapp_database'
      :encoding => 'utf8',
      :pool: 15
    )
end
```

### Using Mongo

[TODO]

---

## Migrations

To generate a new migrate, run:

`rake db:create_migration NAME=create_users`

To migrate your database, run:  

`rake db:migrate`

---

### Notes

The `respond_to` method use the path extension to send response and `Content-Type` header in pre-defined formats, you can set allowed request formats using the constant `RESPOND_TO`and the default response format using `DEFAULT_RESPONSE_FORMAT`, see `app/controllers/application_controller.rb`, `app/controllers/api_controller.rb`, and `app/webapp_controller.rb` to understand this better.

 Try accessing the following URL's to see it in action: 
 
 `http://localhost:4567`
 `http://localhost:4567/sample`
 `http://localhost:4567/sample.json`
 `http://localhost:4567/sample.xml` `# returns 409 Status Code, cause XML is not allowed`
 
`http://localhost:4567/api/sample`  
`http://localhost:4567/api/sample.json` 
`http://localhost:4567/api/sample.xml`

enjoy :)

---

### How to Contribute

##### Pull Requests

**1** Fork this repository	
**2.** Create a new branch for each feature or improvement	
**3.** Send a pull request from each feature branch to the develop branch	

---

### License

"THE BEER-WARE LICENSE" (Revision 42):

As long as you retain this notice you can do whatever you want with this stuff. If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.