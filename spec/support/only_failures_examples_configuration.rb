RSpec.configure do |config|
  # This setting allows us to only re-run examples that had failures.
  # https://relishapp.com/rspec/rspec-core/docs/command-line/only-failures
  #
  # Usage:
  #   bundle exec rspec --only-failures
  #
  # There's also a `--next-failure` option, which is shorthand for `--only-failures --fail-fast --order defined`.
  # It allows you to repeatedly focus on just one of the currently failing examples, then move on to the next failure.
  config.example_status_persistence_file_path = 'spec/support/examples.txt'
end
