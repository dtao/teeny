require 'teeny/version'

require 'json'
require 'sinatra'

class Teeny::Server < Sinatra::Base
  HTTP_METHODS = ['get', 'post', 'put', 'delete']

  before do
    headers 'Access-Control-Allow-Origin' => '*'
  end

  Dir['**/*.rb'].each do |file|
    method = File.basename(file, '.rb')
    next if !HTTP_METHODS.include?(method)

    path = File.dirname(file)
    path = '' if path == '.'

    ruby = File.read(file)

    self.send method, "/#{path}" do
      content_type :json
      eval(ruby, get_binding(params, request.env)).to_json
    end
  end
end

def get_binding(params, env)
  binding
end
