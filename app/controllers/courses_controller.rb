class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :destroy]
 
  skip_before_action :verify_authenticity_token

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def categories
    @course = Course.find(params[:id])
    @categories = @course.categories
  end

  def category_add
  #Convert ids from routing to objects
    @course = Course.find(params[:id])
    @category = Category.find(params[:category])

    unless @course.enrolled_in?(@category)
      #add course to list using << operator
      @course.categories << @category
      flash[:notice] = 'Course was successfully enrolled in category '
    else
       flash[:error] = 'Course was already enrolled'
    end
    redirect_to action: "categories", id: @course
  end

  def category_remove
  #Convert ids from routing to object
  @course = Course.find( params[:id])

  #get list of courses to remove from query string
  category_ids = params[:categories]
  if category_ids.any?
    category_ids.each do |category_ids|
      category = Category.find(category_ids)

      if @course.enrolled_in?(category)
        logger.info "Removing course from Category #{category.id}"
        @course.categories.delete(category)
        flash[:notice] = 'Category was successfully deleted'
      end
    end
  end
  redirect_to action: "categories", id: @course
  end

  def roll
    @course = Course.find(params[:id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:user_id ,:name, :prerequisite,:description, :category, :location, :created)
    end
end
