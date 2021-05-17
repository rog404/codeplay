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
        @instructor = Instructor.new instructor_params
        @instructor.save
        redirect_to @instructor
    end

    def edit
        @instructor = Instructor.find params[:id]
    end

    def update
        @instructor = Instructor.find params[:id]
        @instructor.update instructor_params
    end

    def destroy
        instructor = Instructor.find params[:id]
        instructor.destroy
        redirect_to instructors_path
    end

    private
    def instructor_params
        params.require(:instructor).permit :name, :email, :bio, :profile_picture
    end
end