# StudentsController inherits from ApplicationController
# so any settings defined there will apply to this controller.
class StudentsController < ApplicationController
  # GET '/'
  get '/' do
    # Homepage action to display the student index.
    # Load all the students into an instance variable.
    # We use the ::all method on the Student class, provided by Sequel
    @students = Student.all
    erb :'students/index' # render the index.erb within app/views/students
  end

  get '/students/new' do

    erb :'students/new'
  end

  post '/students' do 
    @student = Student.create(params[:student])
    @student.slug = @student.create_slug
    @student.save

    redirect to "/students/#{@student.slug}"
  end

  get "/students/:slug" do
    @student = Student.find_by(:slug => params[:slug])
    erb :'students/show'
  end


  # GET '/students/new'
  # POST '/students'
  # GET '/students/avi-flombaum'
  # GET '/students/avi-flombaum/edit'
  # POST '/students/avi-flombaum'
end
