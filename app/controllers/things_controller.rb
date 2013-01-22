class ThingsController < ApplicationController
  def index
		@things = Thing.order('created_at ASC').all
  end

  def create
		@thing = Thing.create(params[:thing])
		render :json => @thing
  end

  def update
		@thing = Thing.find(params[:id])
		if params[:thing].has_key?(:content)
			@thing.content = params[:thing][:content]
		end
		@thing.save
		render :json => @thing
  end

  def destroy
		@thing = Thing.find(params[:id])
		@thing.delete
		render :json => @thing
  end
end
