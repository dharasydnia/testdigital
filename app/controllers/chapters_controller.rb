class ChaptersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @chapters = Chapter.where(:ancestry => nil).order('id ASC')
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(params[:chapter])
    if @chapter.save
      flash[:notice] = "Chapter created"
      redirect_to @chapter
    else
      render :action => "new"
    end
  end

  def show
    @chapter = Chapter.find(params[:id])
    unless @chapter.ancestry.blank?
      @subchapter = @chapter.ancestors
    end
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:id])
    if @chapter.update_attributes(params[:chpater])
      flash[:notice] = "Chapter updated"
      redirect_to @chapter
    else
      render :action => "edit"
    end
  end

  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    flash[:notice] = "Chapter destroyed"
    redirect_to chapters_url
  end
end
