# frozen_string_literal: true

require "komoru"
require "webmock/rspec"

module TestHelper
  def load_fixture(fixture)
    File.read("spec/fixtures/#{fixture}.json")
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.include TestHelper
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
