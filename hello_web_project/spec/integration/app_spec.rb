require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app)  { Application.new }

  context "GET /" do
    it "returns 200 ok" do
      response = get('/')
      expect(response.status).to eq 200
    end
    it "returns a message and the name as a parameter" do
      response = get('/?name=Nicola')
      expect(response.body).to eq("Hello Nicola")
    end
  end
  context "GET /names" do
    it 'returns 200 OK' do
      # Assuming there gets request with 3 defined names.
      response = get('/names?name_1=Julia&name_2=Mary&name_3=Karim')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Julia Mary Karim')
    end
    it 'returns the names input into the get request' do
      response = get('/names?name_1=Amy&name_2=Mary&name_3=Karim')
  
      expect(response.status).to eq(200)
      expect(response.body).to eq('Amy Mary Karim')
    end
    it 'returns 404 Not Found' do
      response = get('/name?names=Julia&names=Mary&names=Karim')

      expect(response.status).to eq(404)
      # expect(response.body).to eq(expected_response)
    end
  end

  context "POST /sort-names" do
    it 'returns 200 OK' do
      response = post('/sort-names?name_1=Julia&name_2=Mary&name_3=Karim')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Julia Karim Mary')
    end

    it 'returns 404 Not Found' do
      response = post('/sort-name?names=Julia&names=Mary&names=Karim')

      expect(response.status).to eq(404)
    end
  end


end