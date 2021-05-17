class InstructorsController < ApplicationController
    def index
        @instructors = Instructor.all
    end

    def show
        @instructor = Instructor.find params[:id]
    end

    def new
    end

    def create
        @instructor = Instructor.new user_params
        @instructor.save
        redirect_to instructors_path
    end

    def edit
        @instructor = Instructor.find params[:id]
    end

    def update
        @instructor = Instructor.find params[:id]
        @instructor.update user_params
    end

    def destroy
        instructor = Instructor.find params[:id]
        instructor.destroy
        redirect_to instructors_path
    end

    def user_params
        params.require(:instructor).permit :name, :email, :bio
    end
end