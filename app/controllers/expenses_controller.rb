class ExpensesController < ApplicationController
    
    before_filter :signed_in_user
    before_filter :correct_user, only: [:edit, :update]
    
  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = Expense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
      @expense = current_user.expenses.build(params[:expense])

    respond_to do |format|
      format.html # new.html.erb
      format.js # new.js.erb
      format.json { render json: @expense }
    end
  end
    
    def create_multiple
        params[:expense].each do |expense|
            expense = Expense.create(expense)
        end
        redirect_to expenses_url
    end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
  end

  # POST /expenses
  # POST /expenses.json
  def create
      @expense = current_user.expenses.build(params[:expense])

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render json: @expense, status: :created, location: @expense }
      else
        format.html { render action: "new" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.json
  def update
    @expense = Expense.find(params[:id])

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def update_fields
     @expense = current_user.expenses.build(params[:expense])
     @expense_type = ExpenseType.find(params[:expense_type_id])
     render :partial => 'update_fields', object: @object
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :no_content }
    end
  end
    
    private
    
    def signed_in_user
        unless signed_in?
            store_location
            redirect_to signin_url, notice: "Please sign in."
        end
    end
    
    def admin_user
        redirect_to(root_path) unless current_user.admin?
    end
    
    def correct_user
        @user = Expense.find(params[:id]).user
        redirect_to(root_path) unless current_user?(@user) || current_user.admin?
    end
end
