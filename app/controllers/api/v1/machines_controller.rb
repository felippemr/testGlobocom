module Api
  module V1
    class MachinesController < ApiController
      def index
      	render json:  Machine.all 
      end

      def create
      	@machine = Machine.new(machine_params)
      	if @machine.save
      	  render json: @machine 
      	else
      	  render json: @machine.errors.full_messages 
      	end
      end

      def show
        render json: Machine.find(params[:id])
      end

      def update
      	@machine = Machine.find(params[:id])
      	if @machine.update_attributes(machine_params)
      	  render json: { head: :no_content }
      	else
      	  render json: @machine.errors.full_messages
      	end
      end

      def destroy
        render json: { machine: Machine.any_in( _id: params[:id] ).destroy_all }
      end

      private

      def machine_params
      	params.require(:machine).permit(:name, :location, :application_ids => [])
      end
    end
  end
end