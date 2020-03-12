class ItemsController < ApplicationController
  before_action :set_Item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @Items = Item.all.order("created_at desc")
  end

  def show
  end


  def new
    @Item = current_user.Items.build
  end


  def edit
  end


  def create
    @Item = current_user.Items.build(Item_params)

    respond_to do |format|
      if @Item.save
        format.html { redirect_to @Item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @Item }
      else
        format.html { render :new }
        format.json { render json: @Item.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @Item.update(Item_params)
        format.html { redirect_to @Item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @Item }
      else
        format.html { render :edit }
        format.json { render json: @Item.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @Item.destroy
    respond_to do |format|
      format.html { redirect_to Items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_Item
      @Item = Item.find(params[:id])
    end

    def Item_params
      params.require(:Item).permit(:title, :description, :price)
    end
end
