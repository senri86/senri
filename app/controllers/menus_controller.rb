class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  
  def index 
    @menus = Menu.all
    @menus = Menu.all.order(created_at: :desc)
      search = params[:search]
      @menus =Menu.joins(:user).where("body LIKE ? OR address LIKE ?", "%#{search}%", "%#{search}%")
    
    
    
  end
  

  
  def show
    @menu =Menu.find(params[:id])
    @menus = Menu.all.order(created_at: :desc)
  end

  
  def new
    @menu = Menu.new
  end

  
  def edit
    @menu = Menu.find(params[:id])
  end

 
  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id  
    if @menu.save
      params[:menu][:images]&.each do |image|
        Image.create!(image: image, menu_id: @menu.id)
      end
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

    
  
  

  # PATCH/PUT /menus/1 or /menus/1.json
  def update
    menu = Menu.find(params[:id])
    if menu.update(menu_params)
      redirect_to :action => "show", :id => menu.id
    else
      redirect_to :action => "new"
    end
  end


  # DELETE /menus/1 or /menus/1.json
  def destroy
    menu= Menu.find(params[:id])
    menu.destroy
    redirect_to action: :index
  end


  private
  
  def set_menu
    @menu = Menu.find(params[:id])
  end


  def menu_params
      params.require(:menu).permit(:video, :price,:address,:body,:image,:overall,:level)
  end
end
