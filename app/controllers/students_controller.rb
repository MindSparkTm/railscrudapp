class StudentsController < ApplicationController
  before_action :current_dog, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all

  end

  def show
    @student = Student.find(params[:id])

  end

  def new
    @student = Student.new
  end

  def create
    student = Student.create(student_params)

    redirect_to students_path
  end



  def edit
  end

  def update
    @student.update(student_params)

    redirect_to student_path(@student)

  end

  def destroy
    @student.destroy

    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :score)
  end

  def current_dog
    @student = Student.find(params[:id])
  end
end 
