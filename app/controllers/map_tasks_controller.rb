class MapTasksController < ApplicationController
  # GET /map_tasks
  # GET /map_tasks.json
  def index
    @map_tasks = MapTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @map_tasks }
    end
  end

  # GET /map_tasks/1
  # GET /map_tasks/1.json
  def show
    @map_task = MapTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @map_task }
    end
  end

  # GET /map_tasks/new
  # GET /map_tasks/new.json
  def new
    @map_task = MapTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @map_task }
    end
  end

  # GET /map_tasks/1/edit
  def edit
    @map_task = MapTask.find(params[:id])
  end

  # POST /map_tasks
  # POST /map_tasks.json
  def create
    @map_task = MapTask.new(params[:map_task])

    respond_to do |format|
      if @map_task.save
        format.html { redirect_to @map_task, notice: 'Map task was successfully created.' }
        format.json { render json: @map_task, status: :created, location: @map_task }
      else
        format.html { render action: "new" }
        format.json { render json: @map_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /map_tasks/1
  # PUT /map_tasks/1.json
  def update
    @map_task = MapTask.find(params[:id])

    respond_to do |format|
      if @map_task.update_attributes(params[:map_task])
        format.html { redirect_to @map_task, notice: 'Map task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @map_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /map_tasks/1
  # DELETE /map_tasks/1.json
  def destroy
    @map_task = MapTask.find(params[:id])
    @map_task.destroy

    respond_to do |format|
      format.html { redirect_to map_tasks_url }
      format.json { head :no_content }
    end
  end
end
