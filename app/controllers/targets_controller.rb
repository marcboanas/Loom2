class TargetsController < ApplicationController
    
    before_filter :target_unique, only: :new
    
  # GET /targets
  # GET /targets.json
  def index
    @targets = Target.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @targets }
    end
  end

  # GET /targets/1
  # GET /targets/1.json
  def show
    @target = Target.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @target }
    end
  end

  # GET /targets/new
  # GET /targets/new.json
  def new
      @target = current_user.targets.build(params[:target])
      
      @target.year = current_user.default_year

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @target }
    end
  end

  # GET /targets/1/edit
  def edit
    @target = Target.find(params[:id])
  end

  # POST /targets
  # POST /targets.json
  def create
    @target = current_user.targets.build(params[:target])

    respond_to do |format|
      if @target.save
        undo_link = view_context.link_to("undo", revert_version_path(@target.versions.scoped.last), :method => :post)
        format.html { redirect_to @target, notice: "Successfully created targets. #{undo_link}" }
        format.json { render json: @target, status: :created, location: @target }
      else
        format.html { render action: "new" }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /targets/1
  # PUT /targets/1.json
  def update
    @target = Target.find(params[:id])

    respond_to do |format|
      if @target.update_attributes(params[:target])
        format.html { redirect_to @target, notice: 'Target was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @target.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /targets/1
  # DELETE /targets/1.json
  def destroy
    @target = Target.find(params[:id])
    @target.destroy

    respond_to do |format|
      format.html { redirect_to targets_url }
      format.json { head :no_content }
    end
  end
    
    private
    
    def target_unique
        @targets = current_user.targets.where("year = ?", current_user.default_year)
        
        if !current_user.default_year
            redirect_to(root_path)
            elsif !@targets.empty?
            redirect_to(edit_target_path(@targets[0]))
        end
    end
    
    def undo_link
        view_context.link_to("undo", revert_version_path(@target.versions.scoped.last), :method => :post)
    end
end
