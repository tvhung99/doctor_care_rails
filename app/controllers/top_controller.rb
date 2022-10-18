class TopController < ApplicationController
  def index
    @clinics = Clinic.all.limit(4)
    @specialties = Specialty.all.limit(4)
  end
end