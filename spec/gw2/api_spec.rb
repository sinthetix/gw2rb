require "spec_helper"

describe GW2::API do
  context "initialized with an API key" do
    subject { GW2::API.new("API-KEY-HERE") }

    describe "get" do
      let(:response){ subject.send(:get, "/v2/account/characters") }

      it "gets a response" do
        WebMock.stub_request(:get, "https://api.guildwars2.com/v2/account/characters").
          to_return(:status => 200, :body => '["Zojja","Caithe"]')
        expect(response).to be_kind_of Faraday::Response
        expect(response.status) == 200
        expect(response.body) == '["Zojja","Caithe"]'
      end
    end

    describe "initialize" do
      it "can be initialized with an API key" do
        expect(subject).to be_kind_of GW2::API
      end

      it "returns the API key" do
        expect(subject.api_key).to eq("API-KEY-HERE")
      end
    end

    describe "authenticated?" do
      it "is authenticated" do
        expect(subject.send(:authenticated?)).to be true
      end
    end

    describe "get_response" do
      it "parses the response to JSON if API returns status 200" do
        WebMock.stub_request(:get, "https://api.guildwars2.com/v2/account/characters").
          to_return(:status => 200, :body => '["Zojja", "Caithe"]')
        expect(subject.get_response("/v2/account/characters")).to eq(JSON.parse('["Zojja", "Caithe"]'))
      end

      it "returns an error requesting authorization if API returns status 403" do
        WebMock.stub_request(:get, "https://api.guildwars2.com/v2/account/wallet").
          to_return(:status => 403)
        expect do
          subject.get_response("/v2/account/wallet")
        end.to raise_error("403 Error: Authorization failed. Verify the API key has correct access.")
      end

      it "raises a general error if API returns any status besides 200 or 403" do
        WebMock.stub_request(:get, "https://api.guildwars2.com/v2/account/characters/").
          to_return(:status => 301)
        expect do
          subject.get_response("/v2/account/characters/")
        end.to raise_error("GW2 API returned a 301 error.")
      end
    end
  end

  context "initialized without an API key" do
    subject { GW2::API.new }

    describe "initialize" do
      it "can be initialized without an API key" do
        expect(subject).to be_kind_of GW2::API
      end
    end

    describe "authenticated?" do
      it "is not authenticated" do
        expect(subject.send(:authenticated?)).to be false
      end
    end

    describe "get" do
      let(:response){ subject.send(:get, "/v2/achievements") }

      it "gets a response with a status and body" do
        WebMock.stub_request(:get, "https://api.guildwars2.com/v2/achievements").
          to_return(:status => 200, :body => "[1,2,3]")
        expect(response).to be_kind_of Faraday::Response
        expect(response.status) == 200
        expect(response.body) == "[1,2,3]"
      end
    end

    describe "get_response" do
      it "parses the response to JSON if API returns status 200" do
        WebMock.stub_request(:get, "https://api.guildwars2.com/v2/achievements").
          to_return(:status => 200, :body => "[1,2,3]")
        expect(subject.get_response("/v2/achievements")).to eq(JSON.parse("[1,2,3]"))
      end

      it "returns an error requesting authorization if API returns status 403" do
        WebMock.stub_request(:get, "https://api.guildwars2.com/v2/account").
          to_return(:status => 403)
        expect do
          subject.get_response("/v2/account")
        end.to raise_error("403 Error: Please initialize the GW2 client with a proper API key.")
      end

      it "raises a general error if API returns any status besides 200 or 403" do
        WebMock.stub_request(:get, "https://api.guildwars2.com/v2/achievements/groups/").
          to_return(:status => 301)
        expect do
          subject.get_response("/v2/achievements/groups/")
        end.to raise_error("GW2 API returned a 301 error.")
      end
    end
  end
end
