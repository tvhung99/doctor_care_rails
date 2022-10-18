class Admin::ClinicSpecialtyMappingsController < Admin::AdminController
  def create
    if ClinicSpecialtyMapping.clinic_specialty(csparams[:clinic_id], csparams[:specialty_id]).blank?
      ClinicSpecialtyMapping.create!(csparams.to_h)
    end
    redirect_to admin_clinic_path csparams[:clinic_id]
  end

  def destroy
    @mapping = ClinicSpecialtyMapping.find(params[:id])
    clinic_id = @mapping.clinic_id

    @mapping.destroy

    redirect_to admin_clinic_path clinic_id

  end


  private
  def csparams
    params.permit(:clinic_id, :specialty_id)
  end
end