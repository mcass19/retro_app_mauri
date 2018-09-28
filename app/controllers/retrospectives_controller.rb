# frozen_string_literal: true

# :nodoc
class RetrospectivesController < ApplicationController
  before_action :set_retrospective, only: %i[show edit update destroy]

  def landing_page; end

  # GET /retrospectives
  # GET /retrospectives.json
  def index
    @retrospectives = Retrospective.all
  end

  # GET /retrospectives/1
  # GET /retrospectives/1.json
  def show; end

  # GET /retrospectives/new
  def new
    @retrospective = Retrospective.new
  end

  # GET /retrospectives/1/edit
  def edit; end

  # POST /retrospectives
  # POST /retrospectives.json
  def create # rubocop:disable Metrics/MethodLength
    @retrospective = Retrospective.new(retrospective_params)

    respond_to do |format|
      if @retrospective.save
        format.html do
          redirect_to @retrospective, notice: 'Retrospective was
          successfully created.'
        end
        format.json { render :show, status: :created, location: @retrospective }
      else
        format.html { render :new }
        format.json do
          render json: @retrospective.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /retrospectives/1
  # PATCH/PUT /retrospectives/1.json
  def update # rubocop:disable Metrics/MethodLength
    respond_to do |format|
      if @retrospective.update(retrospective_params)
        format.html do
          redirect_to @retrospective,
                      notice: 'Retrospective was successfully updated.'
        end
        format.json do
          render :show, status: :ok, location: @retrospective
        end
      else
        format.html { render :edit }
        format.json do
          render json: @retrospective.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /retrospectives/1
  # DELETE /retrospectives/1.json
  def destroy
    @retrospective.destroy
    respond_to do |format|
      format.html do
        redirect_to retrospectives_url,
                    notice: 'Retrospective was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_retrospective
    @retrospective = Retrospective.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def retrospective_params
    params.require(:retrospective).permit(:title, :date, :description)
  end
end
