# frozen_string_literal: true

class OpenGraphIO
  require 'cgi'
  require 'json'
  require 'net/http'
  attr_accessor :app_id, :cache_ok, :full_render, :version, :use_proxy


  def initialize(options)
    # Throw an error if app_id is not present in options hash
    raise ArgumentError.new(
      'app_id must be supplied when making requests to the API. '\
      'Get a free app_id by signing up here: https://www.opengraph.io/'
    ) unless options.has_key?(:app_id)

    @app_id = options[:app_id]

    # Assign options if present, or defaults if not
    # These can be overridden when making requests through OpenGraphIO#get_site_info
    @cache_ok =
      options.has_key?(:cache_ok) ?
        options[:cache_ok] :
        true
    @use_proxy =
      options.has_key?(:use_proxy) ?
        options[:use_proxy] :
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
    'https://opengraph.io/api/' + @version + '/site/' + CGI.escape(url)
  end

  def get_site_info_query_params(options)
    query_string_values = {}

    query_string_values[:app_id] = 
      options.has_key?(:app_id) ?
        options[:app_id] :
        @app_id

    query_string_values[:cache_ok] =
      options.has_key?(:cache_ok) ?
        options[:cache_ok] :
        @cache_ok
    
    query_string_values[:use_proxy] =
      options.has_key?(:use_proxy) ?
        options[:use_proxy] :
        @use_proxy

    query_string_values[:full_render] =
      options.has_key?(:full_render) ?
        options[:full_render] :
        @full_render

    query_string_values[:version] =
      options.has_key?(:version) ?
        options[:version] :
        @version

    query_string_values
  end

  def get_site_info(passed_url, options = {})
    uri = URI(get_site_info_url(passed_url))
    uri.query = URI.encode_www_form(get_site_info_query_params(options))
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)
  end
end
