class IncomesController < ApplicationController
    # GET /incomes
    # GET /incomes.json
    def index
        @incomes = Income.all
        
        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @incomes }
        end
    end
    
    # GET /incomes/1
    # GET /incomes/1.json
    def show
        @income = Income.find(params[:id])
        
        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @income }
        end
    end
    
    # GET /incomes/new
    # GET /incomes/new.json
    def new
        @income = Income.new
        
        ExpenseType.where("fixed_asset = ?", true).each do |fa|
            @fixed_assets ||= Array.new
            @fixed_assets.push(fa.id)
        end
        
        @assets = current_user.expenses.find_all_by_expense_type_id(@fixed_assets)
        
        @assets = @assets.select { |asset| asset.sold != true }
        
        respond_to do |format|
            format.html # new.html.erb
            format.js # new.js.erb
            format.json { render json: @income }
        end
    end
    
    def create_multiple
        params[:income].each do |income|
            income = Income.create(income)
        end
        redirect_to incomes_url
    end
    
    # GET /incomes/1/edit
    def edit
        @income = Income.find(params[:id])
    end
    
    # POST /incomes
    # POST /incomes.json
    def create
        @income = Income.new(params[:income])
        
        respond_to do |format|
            if @income.save
                format.html { redirect_to @income, notice: 'Income was successfully created.' }
                format.json { render json: @income, status: :created, location: @income }
                else
                format.html { render action: "new" }
                format.json { render json: @income.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # PUT /incomes/1
    # PUT /incomes/1.json
    def update
        @income = Income.find(params[:id])
        
        respond_to do |format|
            if @income.update_attributes(params[:income])
                format.html { redirect_to @income, notice: 'Income was successfully updated.' }
                format.json { head :no_content }
                else
                format.html { render action: "edit" }
                format.json { render json: @income.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # DELETE /incomes/1
    # DELETE /incomes/1.json
    def destroy
        @income = Income.find(params[:id])
        @income.destroy
        
        respond_to do |format|
            format.html { redirect_to incomes_url }
            format.json { head :no_content }
        end
    end
end