require 'spec_helper'

describe Rack::GitVersion do
  before do
    @status = 200
    @headers = { 'Content-Type' => 'text/plain', 'X-Another-Header' => 'Something' }
    @body = 'Test App'
    @version = "somebranch/SHA234234987"

    @app = Rack::GitVersion.new(lambda{ [@status, @headers, [@body]] })
    @app.stub :git_version => @version
  end

  def app
    @app
  end

  let(:response){ get '/' }

  it "should keep the same HTTP Code" do
    response.status.should == @status
  end

  it "should keep the same body" do
    response.body.should == @body
  end

  it "should add the git version to the headers" do
    response.headers["X-Git-Version"].should == @version
  end

  it "should leave the other headers" do
    @headers.each do |name, value|
      response.headers[name].should == value
    end
  end
end
