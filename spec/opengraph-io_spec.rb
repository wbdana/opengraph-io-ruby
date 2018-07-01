require 'coveralls'
Coveralls.wear!
require 'cgi'
require 'opengraph-io'

RSpec.describe OpenGraphIO, 'OpenGraphIO Ruby Client Tests' do
  context 'Client Setup' do
    it 'should initialize with an app_id and default values' do
      options = {
        app_id: ENV['APP_ID']
      }

      og = OpenGraphIO.new(options)
      expect(og.app_id).to eql(ENV['APP_ID'])
      expect(og.cache_ok).to eql(true)
      expect(og.full_render).to eql(false)
      expect(og.version).to eql('1.1')
    end

    it 'should initialize with overridden default values' do
      options = {
        app_id: ENV['APP_ID'],
        cache_ok: false,
        full_render: true,
        version: '1.0'
      }

      og = OpenGraphIO.new(options)
      expect(og.app_id).to eql(ENV['APP_ID'])
      expect(og.cache_ok).to eql(false)
      expect(og.full_render).to eql(true)
      expect(og.version).to eql('1.0')
    end

    it 'should allow overriding of defaults but otherwise use defaults' do
      options = {
        app_id: ENV['APP_ID'],
        cache_ok: false
      }

      og = OpenGraphIO.new(options)
      expect(og.cache_ok).to eql(false)
      expect(og.full_render).to eql(false)
    end


    it 'should throw an error if an app_id is not provided' do
      expect{ OpenGraphIO.new({}) }.to raise_error(
        ArgumentError,
        'app_id must be supplied when making requests to the API. '\
        'Get a free app_id by signing up here: https://www.opengraph.io/'
      )
    end
  end

  describe 'Request Setup' do
    # TODO should this be even with app_id?
    it 'should create a valid URL with no options except app_id' do
      target = 'http://cnn.com'
      og = OpenGraphIO.new({app_id: ENV['APP_ID']})

      url = og.get_site_info_url(target)
      expect(url).to eql('https://opengraph.io/api/1.1/site/' + CGI.escape(target))
    end

    it 'should use https when using an app_id' do
      target = 'http://cnn.com'
      og = OpenGraphIO.new({app_id: ENV['APP_ID']})
      url = og.get_site_info_url(target)

      expect(url).to eql('https://opengraph.io/api/1.1/site/' + CGI.escape(target))
    end

    it 'should create proper query parameters' do
      options = {
        app_id: ENV['APP_ID'],
        cache_ok: false
      }
      params_override_options = {
        full_render: true
      }
      og = OpenGraphIO.new(options)
      params = og.get_site_info_query_params(params_override_options)

      expect(params[:app_id]).to eql(ENV['APP_ID'])
      expect(params[:cache_ok]).to eql(false)
      expect(params[:full_render]).to eql(true)
    end
  end

  describe 'Full Tests' do
    it 'should get results from a site with no options' do
      og = OpenGraphIO.new({app_id: ENV['APP_ID']})
      test_url = 'https://github.com'
      response = og.get_site_info(test_url)
      expect(response['hybridGraph']['url']).to eql(test_url)
      expect(response['hybridGraph']['title']).to eql('Build software better, together')
    end
  end
end