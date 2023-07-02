class SignupsController < ApplicationController

    # POST
    def create
        new_signup = Signup.create!(signup_params)
        render json: new_signup.activity, status: :created
    rescue ActiveRecord::RecordInvalid => Invalid
        render json: { errors: Invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
# rescue ActiveRecord::RecordInvalid => invalid
#     render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end