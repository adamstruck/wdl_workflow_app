class JobsController < ApplicationController

  before_action :set_job, only: [:show, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    # @jobs = Job.all
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /workflow/:id/jobs/1
  # GET /jobs/1.json
  def show    
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @job.workflow = Workflow.find(params[:workflow_id])
  end

  # POST /jobs
  # POST /workflow/:id/jobs/
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    @job.workflow_id = params['workflow_id']
    @job.options = clean_job_options
    @job.inputs = clean_job_inputs

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /workflow/:id/jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        # Clean params
        @job.inputs = clean_job_inputs
        @job.options = clean_job_options
        @job.save
        # Start workers
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /workflow/:id/jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:workflow_id, :inputs, :options)
    end

    def clean_job_inputs
      begin
        JSON.parse(params['job']['inputs'].to_json)
      rescue
        {}
      end
    end

    def clean_job_options
      begin
        JSON.parse(params['job']['options'].to_json)
      rescue
        {}
      end
    end
    
end
