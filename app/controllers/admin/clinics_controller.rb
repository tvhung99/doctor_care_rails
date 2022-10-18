class Admin::ClinicsController < Admin::AdminController
  def index
    @clinics = Clinic.all
  end
  def new
    @clinic = Clinic.new
  end

  def create
    @clinic = Clinic.new clinic_params
    @clinic.images.attach(params[:clinic][:image])
    if @clinic.save
      flash[:notice] = "Clinic added"
      redirect_to admin_clinics_path
    else
      flash[:error] = @clinic.errors.full_messages
    end
  end

  def show
    @clinic = Clinic.find(params[:id])
  end

  def edit
    @clinic = Clinic.find(params[:id])
  end

  def update
    @clinic = Clinic.find(params[:id])
    @clinic.images.attach(params[:clinic][:image])
    if @clinic.update_columns(clinic_params_update.to_h)
      binding
      flash[:notice] = "Clinic has been updated"
      redirect_to admin_clinics_path
    else
      flash[:error] = @clinic.errors.full_messages
    end
  end

  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.destroy
    params[:id] = nil
    flash[:notice] = "Clinic has been deleted"
    redirect_to :action => :index
  end


  private

  def clinic_params
    params.require(:clinic).permit(:name, :address, :short_description, :description, :image)
  end

  def clinic_params_update
    params.require(:clinic).permit(:name, :address, :short_description, :description)
  end

  def image_param
    params.require(:clinic).permit(:image)
  end
end