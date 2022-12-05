require "rails_helper"

RSpec.describe Rack::Attack do
  include Rack::Test::Methods

  def app = Rails.application

  before { Rack::Attack.reset! }

  describe "throttle excessive qraphql requests by IP address" do
    let(:limit) { 1000 }

    context "when the number of requests is equal to or lower than the limit" do
      before do
        (limit - 1).times { post "/graphql", {}, "REMOTE_ADDR" => "1.2.3.5" }
      end

      it "does not change the request status" do
        post "/graphql", {}, "REMOTE_ADDR" => "1.2.3.4"
        expect(last_response.status).to_not eq(429)
      end
    end

    context "number of requests is higher than the limit" do
      before do
        limit.times { post "/graphql", {}, "REMOTE_ADDR" => "1.2.3.5" }
      end

      it "changes the request status to 429" do
        post "/graphql", {}, "REMOTE_ADDR" => "1.2.3.5"
        expect(last_response.status).to eq(429)
      end
    end
  end
end
