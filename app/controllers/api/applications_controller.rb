class Api::ApplicationsController < ApiController

  def index
  	render json: { applications: Application.all }
  end

  def create
  	@application = Application.new(application_params)
  	if @application.save
  	  render json: { status: :created, application: @application }
  	else
  	  render json: { status: :unprocessable_entity , application: @application.errors.full_messages }
  	end
  end

  def show
    render json: Application.find(params[:id])
  end

  def update
  	@application = Application.find(params[:id])
  	if @application.update_attributes(application_params)
  	  render json: { head: :no_content }
  	else
  	  render json: { status: :unprocessable_entity , application: @application.errors.full_messages }
  	end
  end

  def destroy
    render json: { application: Application.any_in( _id: params[:id] ).destroy_all }
  end

  private

  def application_params
  	params.require(:application).permit(:name, :type)
  end

end