class ListsController < ApplicationController
  def index
    @lists = List.all
    render :index
  end

  def new
    @list = List.new(:name => params[:list])
    render :new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      # use redirect_to after succeffully CRUDing an object
      redirect_to lists_path
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    render :show
  end

  def edit
    @list = List.find(params[:id])
    render :edit
  end
end
