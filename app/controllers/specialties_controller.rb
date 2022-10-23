class SpecialtiesController < ApplicationController
  def index
    @specialties = Specialty.all
  end

  def show
    @specialty = Specialty.find(params[:id])
    @doctors = @specialty.doctors
    @issues = @specialty.specialty_issues
  end
end