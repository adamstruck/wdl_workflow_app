class JobsController < ApplicationController

  before_action :set_job, only: [:show, :update, :destroy]

  # GET /jobs
  # GET /workflows/:id/jobs
  def index
    begin
      @workflow  = Workflow.find(params[:workflow_id])
      @jobs = @workflow.jobs
    rescue
      @jobs = Job.all
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @job.workflow = Workflow.find(params[:workflow_id])
  end

  # POST /jobs
  # POST /workflows/:id/jobs/
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    @job.workflow_id = params['workflow_id']
    @job.options = clean_job_options
    @job.inputs = clean_job_inputs

    respond_to do |format|
      if @job.save
        # Start workers        
        RunJobWorker.perform_async(@job.id)
        CheckJobStatusWorker.perform_async(@job.id)        
        format.html { redirect_to workflow_jobs_url(@job), notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: workflow_jobs_url(@job) }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        # Start workers
        if @job.status == "Succeeded"
          FetchJobOutputs.perform_async(@job.id)
          FetchJobMetadata.perform_async(@job.id)
        end
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
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
