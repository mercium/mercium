require 'spec_helper'

describe ShopController do
  describe "routing" do
    it "should recognise and generate /" do
      { :get => "/" }.should route_to(:controller => "shop", :action => "index")
    end
  end
end
