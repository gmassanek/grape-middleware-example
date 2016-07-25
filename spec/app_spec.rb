require 'rack/test'
require_relative '../lib/app'

describe Api do
  include Rack::Test::Methods

  def app
    Rack::Builder.app { run Api::App.new }
  end

  before(:each) do
    Api::Middleware.count = 0
  end

  it 'v1 calls middleware 1 time' do
    header 'Accept-Version', '1.0'
    get "/foo"
    expect(last_response.body).to eq('1')
  end

  it 'v2 calls middleware 1 time' do
    header 'Accept-Version', '2.0'
    get "/foo"
    expect(last_response.body).to eq('1')
  end
end
