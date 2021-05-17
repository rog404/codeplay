class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def show
        @course = Course.find params[:id]
    end

    def new
    end

    def create
        @course = Course.new course_params
        @course.save
        redirect_to @course
    end

    def edit
        @course = Course.find params[:id]
    end

    def update
        @course = Course.find params[:id]
        @course.update course_params
    end

    private
    def course_params
        params.require(:course).permit :name, :description, :code, :price, :enrollment_deadline
    end
end