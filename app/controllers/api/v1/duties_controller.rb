class Api::V1::DutiesController < ApplicationController
  before_action :set_duty, only: %i[ show update destroy ]

  # GET /duties
  #  retrieves all duties and renders them as JSON with a success status code.
  def index
    @duties = Duty.all
    render json: @duties, status: :ok
  end

  # GET /duties/1
  #  fetches a specific duty by its ID and renders it as JSON with a success status code.
  def show
    render json: @duty, status: :ok
  end

  # POST /duties
  #  creates a new duty based on the parameters received. If successful, it renders the created duty as JSON with a status of "created". If the creation fails, it renders the errors with a status code indicating unprocessable entity.
  def create
    @duty = Duty.new(duty_params)

    if @duty.save
      render json: @duty, status: :created
    else
      render json: @duty.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /duties/1
  #  updates an existing duty based on the parameters received. If the update is successful, it renders the updated duty as JSON with a success status code. If the update fails, it renders the errors with a status code indicating unprocessable entity.
  def update
    if @duty.update(duty_params)
      render json: @duty
    else
      render json: @duty.errors, status: :unprocessable_entity
    end
  end

  # DELETE /duties/1
  #  deletes a specific duty by its ID. It then renders a success message as JSON with a status code of "ok".
  def destroy
    @duty.destroy
    render json: { message: "Duty was successfully destroyed." }, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # This private method finds and sets the duty based on the ID parameter received in the request.
    def set_duty
      @duty = Duty.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #  defines the permitted parameters for creating or updating a duty, allowing only specific attributes for mass assignment.
    def duty_params
      params.require(:duty).permit(:name, :assignment_id, :max_members_for_duties)
    end
end
