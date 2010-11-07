# Create a matcher to test if a file exists on disk,
# based on the expected filename string passed in.
RSpec::Matchers.define :exist_on_disk do |expected|

  match do |expected|
		File.exists?(expected) == true
  end

  failure_message_for_should do |expected|
    "expected that #{expected} would exist on disk."
  end

  failure_message_for_should_not do |expected|
    "expected that #{expected} would not exist on disk."
  end

  description do
    "#{expected} should exist on disk"
  end
end
