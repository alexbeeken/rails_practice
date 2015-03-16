class ListsController < ApplicationController
  # inside each method in the brackets, this will run find_list
  before_action :find_list, only: [:show, :edit, :update, :destroy]
  before_action :all_lists, only: [:index]

  def index
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
      if @list.save
      # use redirect_to after succeffully CRUDing an object
      redirect_to lists_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @list.update(list_params)
      flash[:notice] = "List successfully updated!"
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

    def find_list
      @list = List.find(params[:id])
    end

    def all_lists
      @lists = List.all
    end

    def list_params
      # anything in controller has access to params
      params.require(:list).permit(:name, :description)
    end

end
