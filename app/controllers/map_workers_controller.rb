class MapWorkersController < ApplicationController
  # GET /map_workers
  # GET /map_workers.json
  def index
    @map_workers = MapWorker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @map_workers }
    end
  end

  # GET /map_workers/1
  # GET /map_workers/1.json
  def show
    @map_worker = MapWorker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @map_worker }
    end
  end

  # GET /map_workers/new
  # GET /map_workers/new.json
  def new
    @map_worker = MapWorker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @map_worker }
    end
  end

  # GET /map_workers/1/edit
  def edit
    @map_worker = MapWorker.find(params[:id])
  end

  # POST /map_workers
  # POST /map_workers.json
  def create
    @map_worker = MapWorker.new(params[:map_worker])

    respond_to do |format|
      if @map_worker.save
        format.html { redirect_to @map_worker, notice: 'Map worker was successfully created.' }
        format.json { render json: @map_worker, status: :created, location: @map_worker }
      else
        format.html { render action: "new" }
        format.json { render json: @map_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /map_workers/1
  # PUT /map_workers/1.json
  def update
    @map_worker = MapWorker.find(params[:id])

    respond_to do |format|
      if @map_worker.update_attributes(params[:map_worker])
        format.html { redirect_to @map_worker, notice: 'Map worker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @map_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /map_workers/1
  # DELETE /map_workers/1.json
  def destroy
    @map_worker = MapWorker.find(params[:id])
    @map_worker.destroy

    respond_to do |format|
      format.html { redirect_to map_workers_url }
      format.json { head :no_content }
    end
  end
end
