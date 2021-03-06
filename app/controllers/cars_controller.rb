class CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all

    render json: @cars
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    render json: @car
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    if @car.save
      render json: @car, status: :created, location: @car
    else
      render json: @car.errors, status: :bad_request
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      head :no_content
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy

    head :no_content
  end

  private

    def set_car
			begin
				@car = Car.find(params[:id])
			rescue => e
				head :not_found
			end
    end

    def car_params
      params.permit(:brand, :model, :model_year, :color)
    end
end
