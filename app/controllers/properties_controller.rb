class PropertiesController < ApplicationController
  before_action :set_property, only: [:edit, :update, :show, :destroy]
  #before_action :require_admin_lvl_2, only: [:new, :create, :destroy]
  #before_action :require_admin_lvl_1, only: [:edit, :update]

  def index
    @property = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:success] = "Property successfully created"
      redirect_to property_path(@property)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @property.update(property_params)
      flash[:success] = "Property successfully updated"
      redirect_to property_path(@property)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @property.destroy
    flash[:danger] = "Property and all assets successfully deleted"
    redirect_to properties_path
  end

    private
    def property_params
      params.require(:property).permit(:name, :acres, :address, :cost, :sqFootage)
    end

    def set_property
      @property = Property.find(params[:id])
    end

end
