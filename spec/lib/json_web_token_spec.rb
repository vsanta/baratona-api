require "rails_helper"
require "support/indifferent_access_matcher"

describe "JsonWebToken" do

  let(:payload){ {key: "value"} }

  describe "decodes and decodes payload" do
    let(:token) { JsonWebToken.encode(payload, expiration) }
    let(:not_before){ Time.now.to_i - 3600}
    subject{ JsonWebToken.decode(token) }

    context "non expired token" do
      let(:expiration){ 24.hours.from_now }

      it "can be decoded" do
        expect(subject).to equal_with_indifferent_access payload
        expect(subject).to include({exp: expiration.to_i})
        expect(subject).to include({nbf: not_before})
      end
    end

    context "expired token" do
      let(:expiration){ 1.minute.ago.to_i }

      it "returns nil" do
        expect(subject).to be_nil
      end
    end
  end
end
