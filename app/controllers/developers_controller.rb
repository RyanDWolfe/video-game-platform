class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]

  def show
    @game = Game.new
    @developer = Developer.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @developer}
    end
  end

  def index
    @developers = Developer.all
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
    render json: @developer, status: 201
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @developer.update(developer_params)
      redirect_to @developer
    else
      render :edit
    end
  end

  def destroy
    @developer.destroy
    redirect_to developers_path
  end

private

  def set_developer
    @developer = Developer.find(params[:id])
  end

  def developer_params
    params.require(:developer).permit(:name)
  end

end
