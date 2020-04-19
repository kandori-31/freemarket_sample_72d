class UsersController < ApplicationController
  include CommonModuleForControllers
  before_action :authenticate_user!
  before_action :set_item, only: [:edit, :show, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :reject_non_authenticate_user,only: [:show, :edit]
  before_action :set_category
  before_action :user_params, only: [:update]
  before_action :user_show_info, only: [:show ,:edit ]
  def show

  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      redirect_to edit_user_path(@user.id)
    end
  end

  def profile
  end

  def address
  end

  def logout
  end

  def support
  end

  def registration
  end

  def defect_support
  end

  def trouble_support
  end

  def request_suppport
  end

  def evaluation_support
  end

  def buy_support
  end

  def withdraw_support
  end

  def other_support
  end

  def likes
  end
  
  def user_show_info
    @exhibitor = User.where(id: @item.exhibitor_id).first
    @items = Item.where(exhibitor_id: @user)
    @evaluations = Item.where(buyer_id_status: @user)
  end

  def reject_non_authenticate_user
    if @user.id != current_user.id
      redirect_to user_session_path
    end
  end

  private
  def user_params
    reject = %w()
    #ItemModelでインクルードしたモジュールメソッドを使う(他のモデルで流用可能)
    columns = User.column_symbolized_names(reject)
    params.require(:user).permit(*columns)
  end
end