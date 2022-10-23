class Admin::SpecialtyIssuesController < Admin::AdminController

  def create
    if SpecialtyIssue.by_name(params[:name]).blank?
      SpecialtyIssue.create!(ciparams.to_h)
    end
    redirect_to admin_specialty_path ciparams[:specialty_id]
  end

  def destroy
    @issue = SpecialtyIssue.find(params[:id])
    specialty_id = @issue.specialty_id

    @issue.destroy

    redirect_to admin_specialty_path specialty_id
  end


  private
  def ciparams
    params.permit(:specialty_id,:name)
  end
end