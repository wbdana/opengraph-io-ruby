require 'opengraph-io'

RSpec.describe OpenGraphIO, 'OpenGraphIO Ruby Client Tests' do
  # before(:suite) do
  #   APP_ID = ENV['APP_ID']
  # end
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
end