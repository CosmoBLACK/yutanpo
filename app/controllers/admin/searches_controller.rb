class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range] # 検索モデルの情報を受け取る
    if @range == "Member"
      @members = Member.looks(params[:search], params[:word]).page(params[:page]).per(10) # 検索方法,検索ワードの情報を検索し,モデル内の検索結果を代入
    else
      @onsens = Onsen.looks(params[:search], params[:word]).page(params[:page]).per(10)
    end
    @tag_list = Tag.all
  end
end