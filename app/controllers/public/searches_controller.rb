class Public::SearchesController < ApplicationController
  def search
    @range = params[:range] # 検索モデルの情報を受け取る
    @onsens = Onsen.looks(params[:search], params[:word]) # 検索方法,検索ワードの情報を検索し,モデル内の検索結果を代入
  end
end