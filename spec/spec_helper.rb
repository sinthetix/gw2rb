$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "gw2"
require "rspec"
require "webmock"
require "vcr"

RSpec.configure do |config|

end

WebMock.disable_net_connect!

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { record: :once, match_requests_on: [:method, :host, :path] }
  c.ignore_localhost = true
  c.configure_rspec_metadata!
end
