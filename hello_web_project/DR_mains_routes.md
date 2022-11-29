# GET NAMES & SORT NAMES Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method: GET 
  * the path: /names
  * any query parameters :name 
  <!-- * or body parameters (passed in the request body) -->
  * the HTTP method: POST
  * the path: /sort-names
  * any query parameters :names (array)

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._


<!-- EXAMPLE -->
<!-- Response when the post is found: 200 OK -->
When Query param `names` is Julia, Mary, Karim
```
Julia, Mary, Karim

```
When Query param `names` is Julia, Mary, Karim
```
Julia, Karim, Mary

<!-- EXAMPLE -->
<!-- Response when the post is found: 404 OK -->
When Query param `name` is Duncan

Does not exist


## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /names?names=Julia&names=Mary&names=Karim

POST /sort-names?names=["Julia","Mary","Karim"]

# Expected response:

Response for 200 OK
Return Julia Mary Karim

Response for 200 OK
Return Karim Julia Mary
# Request:

GET /name?names=Julia&names=Mary&names=Karim
POST /sort-names?name=["Julia","Mary","Karim"]

# Expected response:

Response for 404 Not Found
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it 'returns 200 OK' do
      # Assuming there gets request with 3 defined names.
      response = get('/names?names=Julia&names=Mary&names=Karim')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Julia Mary Karim')
    end

    it 'returns 404 Not Found' do
      response = get('/name?names=Julia&names=Mary&names=Karim')

      expect(response.status).to eq(404)
    end
  end

  context "POST /sort-names" do
    it 'returns 200 OK' do
      # Assuming there gets request with 3 defined names.
      response = post('/sort-names?names=["Julia","Mary", "Karim")

      expect(response.status).to eq(200)
      expect(response.body).to eq('Karim Julia Mary')
    end

    it 'returns 404 Not Found' do
      response = post('/sort-name?names=Julia&names=Mary&names=Karim')

      expect(response.status).to eq(404)
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.