class Admin::SpecialtiesController < Admin::AdminController
  def index
    @specialties = Specialty.all
  end
  def new
    @specialty = Specialty.new
  end

  def create
    @specialty = Specialty.new specialty_params
    @specialty.images.attach(params[:specialty][:image])
    if @specialty.save
      flash[:notice] = "Clinic added"
      redirect_to admin_specialties_path
    else
      flash[:error] = @specialty.errors.full_messages
    end
  end

  def show
    @specialty = Specialty.find(params[:id])
  end

  def edit
    @specialty = Specialty.find(params[:id])
  end

  def update
    @specialty = Specialty.find(params[:id])
    @specialty.images.attach(params[:specialty][:image]) if params[:specialty][:image].present?
    if @specialty.update_columns(specialty_params_update.to_h)
      flash[:notice] = "Specialty has been updated"
      redirect_to admin_specialty_path
    else
      flash[:error] = @specialty.errors.full_messages
    end
  end

  def destroy
    @specialty = Specialty.find(params[:id])
    @specialty.destroy
    params[:id] = nil
    flash[:notice] = "Clinic has been deleted"
    redirect_to :action => :index
  end


  private

  def specialty_params
    params.require(:specialty).permit(:name, :description, :image, :short_description, :issue_title)
  end

  def specialty_params_update
    params.require(:specialty).permit(:name, :description, :short_description, :issue_title)
  end

  def image_param
    params.require(:specialty).permit(:image)
  end
end