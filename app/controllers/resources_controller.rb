class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(params[:resource])

    if @resource.save
        flash[:notice] = 'Resource was successfully created.'
        redirect_to @resource
      else
        render :action => "new"
      end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])

  if @resource.update_attributes(params[:resource])
    flash[:notice] = 'Resource was successfully updated.'
    redirect_to @resource
    else
      render :action => "edit"
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    flash[:notice] = 'Resource was successfully deleted.'
    redirect_to resources_url
  end

  def tagged
    if params[:tag].precent?
      @resource = resource.tagged_with(params[:tag])
    else
      @resource = resource.resourceall
    end
  end
end
