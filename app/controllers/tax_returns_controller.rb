class TaxReturnsController < ApplicationController
    
    before_filter :tax_return_unique, only: :new
    
  # GET /tax_returns
  # GET /tax_returns.json
  def index
    @tax_returns = TaxReturn.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tax_returns }
    end
  end

  # GET /tax_returns/1
  # GET /tax_returns/1.json
  def show
    @tax_return = TaxReturn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tax_return }
    end
  end

  # GET /tax_returns/new
  # GET /tax_returns/new.json
  def new
      @tax_return = current_user.tax_returns.build(params[:tax_return])
      
      1.times { @tax_return.employers.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tax_return }
    end
  end

  # GET /tax_returns/1/edit
  def edit
    @tax_return = TaxReturn.find(params[:id])
  end

  # POST /tax_returns
  # POST /tax_returns.json
  def create
      
    @tax_return = current_user.tax_returns.build(params[:tax_return])

    respond_to do |format|
      if @tax_return.save
        format.html { redirect_to @tax_return, notice: 'Tax return was successfully created.' }
        format.json { render json: @tax_return, status: :created, location: @tax_return }
      else
        format.html { render action: "new" }
        format.json { render json: @tax_return.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tax_returns/1
  # PUT /tax_returns/1.json
  def update
    @tax_return = TaxReturn.find(params[:id])

    respond_to do |format|
      if @tax_return.update_attributes(params[:tax_return])
         undo_link = view_context.link_to("undo", revert_version_path(@tax_return.versions.scoped.last), :method => :post)
        format.html { redirect_to @tax_return, notice: "Successfully updated product. #{undo_link}" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tax_return.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tax_returns/1
  # DELETE /tax_returns/1.json
  def destroy
    @tax_return = TaxReturn.find(params[:id])
    @tax_return.destroy

    respond_to do |format|
      format.html { redirect_to tax_returns_url }
      format.json { head :no_content }
    end
  end
    
    private
    
    def tax_return_unique
        @tax_returns = current_user.tax_returns.where("year = ?", current_user.default_year)
        
        if !current_user.default_year
        redirect_to(root_path)
        elsif !@tax_returns.empty?
        redirect_to(edit_tax_return_path(@tax_returns[0]))
        end
    end
    
    def undo_link
        view_context.link_to("undo", revert_version_path(@tax_return.versions.scoped.last), :method => :post)
    end
end
