# match hashes with indifferent access
#
# example)
# expect({"key1" => 1, :key2 => 2}).to equal_with_indifferent_access(key1: 1, key2: 2)

RSpec::Matchers.define :equal_with_indifferent_access do |expected|
  match do |actual|
    actual.with_indifferent_access == expected.with_indifferent_access
  end

  failure_message do |actual|
    <<-EOS
    expected: #{expected}
         got: #{actual}
    EOS
  end

  failure_message_when_negated do |actual|
    <<-EOS
    expected: value != #{expected}
         got:          #{actual}
    EOS
  end
end
