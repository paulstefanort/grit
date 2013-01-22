class SiteController < ApplicationController
  def index
		@things = Thing.order('created_at ASC').all
  end
end
