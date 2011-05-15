class FlyingObjectsController < ApplicationController
  # GET /flying_objects
  # GET /flying_objects.xml
  def index
    @flying_objects = FlyingObject.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flying_objects }
    end
  end

  # GET /flying_objects/1
  # GET /flying_objects/1.xml
  def show
    @flying_object = FlyingObject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flying_object }
    end
  end

  # GET /flying_objects/new
  # GET /flying_objects/new.xml
  def new
    @flying_object = FlyingObject.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flying_object }
    end
  end

  # GET /flying_objects/1/edit
  def edit
    @flying_object = FlyingObject.find(params[:id])
  end

  # POST /flying_objects
  # POST /flying_objects.xml
  def create
    @flying_object = FlyingObject.new(params[:flying_object])

    respond_to do |format|
      if @flying_object.save
        format.html { redirect_to(@flying_object, :notice => 'Flying object was successfully created.') }
        format.xml  { render :xml => @flying_object, :status => :created, :location => @flying_object }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flying_object.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flying_objects/1
  # PUT /flying_objects/1.xml
  def update
    @flying_object = FlyingObject.find(params[:id])

    respond_to do |format|
      if @flying_object.update_attributes(params[:flying_object])
        format.html { redirect_to(@flying_object, :notice => 'Flying object was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flying_object.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flying_objects/1
  # DELETE /flying_objects/1.xml
  def destroy
    @flying_object = FlyingObject.find(params[:id])
    @flying_object.destroy

    respond_to do |format|
      format.html { redirect_to(flying_objects_url) }
      format.xml  { head :ok }
    end
  end
end
