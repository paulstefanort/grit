class SiteController < ApplicationController
  def index
		@things = Thing.all
  end
end
