# frozen_string_literal: true

class OpenGraphIO
  require 'cgi'
  require 'net/http'
  attr_accessor :app_id, :cache_ok, :full_render, :version


  def initialize(options)
    # Throw an error if app_id is not present in options hash
    raise StandardError.new(
      'app_id must be supplied when making requests to the API.'\
      'Get a free app_id by signing up here: https://www.opengraph.io/'
    ) unless options.has_key?(:app_id)

    @app_id = options[:app_id]

    # Assign options if present, or defaults if not
    # These can be overridden when making requests through OpenGraphIO#get_site_info
    @cache_ok =
      options.has_key?(:cache_ok) ?
        options[:cache_ok] :
        true
    @full_render =
      options.has_key?(:full_render) ?
        options[:full_render] :
        false
    @version =
      options.has_key?(:version) ?
        options[:version] :
        '1.1'
  end

  def get_site_info_url(url)
    'https://opengraph.io/api' + @version + '/site/' + CGI.escape(url)
  end

  def get_site_info_query_params(options)
    query_string_values = {}

    query_string_values[:cache_ok] =
      options.has_key?(:cache_ok) ?
        options[:cache_ok] :
        @cache_ok

    query_string_values[:app_id] = 
      options.has_key?(:app_id) ?
        options[:app_id] :
        @app_id
    
    query_string_values
  end

  
end