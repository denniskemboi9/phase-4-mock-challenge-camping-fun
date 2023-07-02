class CampersController < ApplicationController
    # wrap_parameters format: []

    # Get
    def index
        render json: Camper.all
    end

    # Show
    def show
        camper_by_id = Camper.find_by(id: params[:id])
        if camper_by_id
            render json: camper_by_id, serializer: CamperActivitiesSerializer
        else
            render json: { "error": "Camper not found" }, status: :not_found
        end
    end

    # # Create
    # def create
    #     new_camper = Camper.create!(camper_params)
    #     render json: new_camper, status: :created
    # rescue ActiveRecord::RecordInvalid => Invalid
    #     render json: { "errors": "Not possible" }, status: :unprocessable_entity
    # end

    def create
        new_camper = Camper.create!(camper_params)
        render json: new_camper, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
      
      

    private
    def camper_params
        params.permit(:name, :age)
    end
end
