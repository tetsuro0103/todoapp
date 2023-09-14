class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = current_user.cards.build
  end

  def create
    @card = current_user.cards.build(card_params)
    if @card.save
      redirect_to card_path(@card),notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    # @card = current_user.cards.find(params[:id])
    @card = Card.find(params[:id])
  end

  def update
    @card = current_user.cards.find(params[:id])
    if @card.update(card_params)
      redirect_to card_path(@card), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    card = current_user.cards.find(params[:id])
    card.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
  def card_params
    params.require(:card).permit(:title, :content, :eyecatch)
  end

  def set_card
    @card = card.find(params[:id])
  end
end
