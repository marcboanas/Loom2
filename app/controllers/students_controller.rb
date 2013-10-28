class StudentsController < ApplicationController
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
      
      @paymentCount = 0
      
      @totalValue = [0]
      
      @payments = []
      
    @students.each do |s|
      
    @payments ||= Array.new
        
    if s.incomes.count > 0 
        
    @payments.push(s.incomes)
        
    end
        
    end
        
    @payments.each do |p|
        
    @paymentCount += p.count
       
    @value = p.map(&:value).inject(0, &:+)
        
    @totalValue ||= Array.new
        
    @totalValue.push(@value)
        
    end
        
    @total = @totalValue.inject{|sum,x| sum + x }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
        
        
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
      @student = current_user.students.build(params[:student])

    respond_to do |format|
      format.html # new.html.erb
      format.js # new.js.erb
      format.json { render json: @student }
    end
  end
    
    def create_multiple
        params[:student].each do |student|
        student = Student.create(student)
        end
        redirect_to students_url
    end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
    @student = current_user.students.build(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to root_url, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
