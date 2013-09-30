class PlansController < ApplicationController
    def index
        @plans = Plan.all
    end
    
    def show
        @plan = Plan.find(params[:id])
    end
    
    def new
       @plan = Plan.new
    end
    
    def create
        @plan = Plan.new(params[:plan])
        
        respond_to do |format|
            if @plan.save
                format.html { redirect_to @plan, notice: 'Income was successfully created.' }
                format.json { render json: @plan, status: :created, location: @plan }
                else
                format.html { render action: "new" }
                format.json { render json: @plan.errors, status: :unprocessable_entity }
            end
        end
    end
end
