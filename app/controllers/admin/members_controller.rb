class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @members = Member.page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path(@member.id), success: "会員情報を更新しました！"
    else
      render :edit
    end
  end

  private

  def member_params
    params.require(:member).permit(:name, :email, :password, :deleted_flag)
  end
end
