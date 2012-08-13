class ContentsController < ApplicationController
  before_filter :authenticate_user!
  def index
    if params[:chapter_id]
      @contents = Content.where(:chapter_id => params[:chapter_id], :ancestry => nil).order('id ASC')
      @chapter = Chapter.where(:id => params[:chapter_id])
    else
      @contents = Content.where(:ancestry => nil).order('id ASC')
      @chapter = Chapter.all
    end
  end
  def new
		@content = Content.new
    @chapters = Chapter.where(:ancestry => nil).order('id asc')
    @parentrecord = Content.find_by_id(params[:parent_id])
	end

  def create
		@content = Content.new(params[:content])
		if @content.save
			flash[:notice] = "Successfully created content"
			redirect_to @content
		else
			render :action => 'new'
		end
	end

  def show
		@content = Content.find(params[:id])
    unless @content.ancestry.blank?
      @child_content = @content.ancestors
    end
	end

  def edit
		@content = Content.find(params[:id])
    @chapters = Chapter.where(:ancestry => nil).order('id asc')
	end

	def update
		@content = Content.find(params[:id])
		if @content.update_attributes(params[:content])
			flash[:notice] = "Successfully updated content"
			redirect_to @content
		else
			render :action => 'edit'
		end
	end

	def destroy
		@content = Content.find(params[:id])
		@content.destroy
		flash[:notice] = "Successfully destroyed content"
		redirect_to contents_url
	end
end
