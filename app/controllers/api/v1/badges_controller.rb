class Api::V1::BadgesController < ApplicationController
  before_action :set_badge, only: %i[ show update destroy ]

  # GET /badges
  # fetches all badges and renders them as JSON with a success status code.

  def index
    @badges = Badge.all
    render json: @badges, status: :ok
  end

  # GET /badges/1
  # fetches a specific badge by its ID and renders it as JSON with a success status code.

  def show
    render json: @badge, status: :ok
  end

  # POST /badges

  # creates a new badge based on the parameters received. 
  #If successful, it renders the created badge as JSON with a status of "created". 
  #If the creation fails, it renders the errors with a status code indicating unprocessable entity.

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      render json: @badge, status: :created
    else
      render json: @badge.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /badges/1

  # updates an existing badge based on the parameters received. 
  #If the update is successful, it renders the updated badge as JSON with a success status code. 
  #If the update fails, it renders the errors with a status code indicating unprocessable entity.

  def update
    if @badge.update(badge_params)
      render json: @badge, status: :ok
    else
      render json: @badge.errors, status: :unprocessable_entity
    end
  end

  # DELETE /badges/1
  # deletes a specific badge by its ID. It then renders a success message as JSON with a status code of "ok".

  def destroy
    @badge.destroy
    render json: { message: 'Badge was successfully destroyed.'}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # is a private helper that finds and sets the badge based on the ID parameter received in the request.

    def set_badge
      @badge = Badge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # defines the permitted parameters for creating or updating a badge, allowing only specific attributes for mass assignment.

    def badge_params
      params.require(:badge).permit(:name, :description, :image_name, :image_file)
    end
end
