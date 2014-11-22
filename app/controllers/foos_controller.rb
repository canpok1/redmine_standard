class FoosController < ApplicationController
  unloadable
  menu_item :standard
  before_filter :find_project, :authorize
  before_filter :find_foo, :except => [:index, :new, :create, :preview]

  layout 'standard'

  def index
    @foos = Foo.find(:all, :conditions => ["project_id = #{@project.id} "])
  end


  def new
    @foos = Foo.new()
  end


  def show
  end


  def edit
  end

  def create
    @foo = Foo.new(params[:foo])
    @foo.project_id = @project.id

    if @foo.save
      finish[:notice] = l(:notice_successful_create)
      redirect_to project_foo_path(@project, @foo.id)
    end
  end

  def destroy
    @foo.destroy
    redirect_to project_foos_path(@project)
  end

  def update
    @foo.attributes = params[:foo]
    if @foo.save
      flash[:notice] = l(:notice_successful_update)
      redirect_to project_foo_path(@project, @foo.id)
    end
  rescue ActiveRecord::StaleObjectError
    flash.now[:error] = l(:notice_locking_conflict)
  end

  def preview
    @text = params[:foo][:description]
    render :partial => 'common/preview'
  end

private
  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def find_foo
    @foo = Foo.find_by_id(params[:id])
    render_404 unless @foo
  end

end
