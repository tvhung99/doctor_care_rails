class SpecialtiesController < ApplicationController
  def index
    @specialties = Specialty.all
  end

  def show
    @specialty = Specialty.find(params[:id])
    @doctors = @specialty.doctors
  end
end