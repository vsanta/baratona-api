require "rails_helper"

describe "AuthenticateUser" do
  subject{ AuthenticateUser.call("test@example.com", "password") }
  let(:user){ instance_double("User", id: 1) }

  before(:each) do
    expect(User).to receive(:find_by_email).and_return(user)
    allow(user).to receive(:authenticate) { is_authenticated }
  end

  context "user with valid credentials" do
    let(:user_token){ "some token" }
    let(:is_authenticated){ true }

    before(:each) do
      allow(JsonWebToken).to receive(:encode).with(user_id: 1) { user_token }
    end

    it "populates result with user token" do
      expect(subject.result).to be user_token
    end

    it_behaves_like "a successful command" do
      let(:command) {subject}
    end
  end

  context "user with invalid credentials" do
    let(:is_authenticated){ false }

    it "result will be nil" do
      expect(subject.result).to be_nil
    end

    it_behaves_like "an unsuccessful command" do
      let(:command) {subject}
      let(:error_hash){ {user_authentication: ['invalid credentials']} }
    end
  end

  context "unregistered user" do
    let(:user) { nil }

    it "result will be nil" do
      expect(subject.result).to be_nil
    end

    it_behaves_like "an unsuccessful command" do
      let(:command) {subject}
      let(:error_hash){ {user_authentication: ['invalid credentials']} }
    end
  end
end
