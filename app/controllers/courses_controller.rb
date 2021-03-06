class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @search = Course.ransack(params[:q])
    @courses = @search.result.order("created_at DESC").paginate(page: params[:page], per_page: 7)
  end

  # POST /enrolls
  # POST /enrolls.json
  def enroll
    @course = Course.find(params[:id])
    @enroll = @course.enrolls.create(params.permit(:course_id,:user_id))
    @enroll.user_id = current_user.id
    
      respond_to do |format|
        if @enroll.save
          format.html { redirect_to @course, notice: 'Enroll was successfully created.' }
          format.json { render json: @enroll, status: :created, location: @enroll }
        else
          format.html { redirect_to @course}
          format.json { render json: @enroll.errors, status: :unprocessable_entity }
        end
      end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  #  @syllabuses = Syllabus.all.where(course_id: @course.id)
    @posts = Post.all.where(course_id: @course.id).where.not(id: Flag.select(:post_id)).paginate(page: params[:page], per_page: 7)
  #  @myposts = Post.all.where(course_id: @course.id).where(user: current_user).where.not(id: Flag.select(:post_id))
    if user_signed_in?
      @enrolls = Enroll.all.where(user_id: current_user.id).where(course_id: @course.id)
      @signup = Enroll.all.where(course_id: @course.id)
    else
      @enrolls = Enroll.all.where(course_id: @course.id)
    end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :subject_id, :university_id)
    end
end
