class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  def index
    @units = policy_scope(Unit).order(:name)
  end

  def show
  end

  def new
    @unit = Unit.new
    authorize @unit
  end

  def create
    @unit = Unit.new(unit_params)
    authorize @unit

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'unit was successfully created.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to @unit, notice: 'unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url, notice: 'unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_unit
      @unit = Unit.find(params[:id])
      authorize @unit
    end

    def unit_params
      params.require(:unit).permit(:name, :abbrevation, :unit_factor, :category)
    end
end
