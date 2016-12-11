
shared_examples "an unsuccessful command" do
  it "is not successful" do
    expect(command.success?).to be false
    expect(command.failure?).to be true
    expect(command.errors).to include error_hash
  end
end


shared_examples "a successful command" do
  it "is successful" do
    expect(command.success?).to be true
    expect(command.failure?).to be false
    expect(command.errors).to be_empty
  end
end
