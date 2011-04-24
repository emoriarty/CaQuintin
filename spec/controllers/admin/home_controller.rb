require 'spec_helper'

describe UsersController do
  render_admin_home

  describe "GET 'index'" do

    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
end