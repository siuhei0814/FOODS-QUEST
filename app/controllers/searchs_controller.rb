class SearchsController < ApplicationController

  def search
    @content1 = params["content1"]
    @content2 = params["content2"]
    @method1 = params["method1"]
    @method2 = params["method2"]

    if (@content1.present? && @content2.blank?)
      if @method1 == 'perfect'
        @posts = Post.where(cooking_name: @content1)
      else
        @posts = Post.where('cooking_name LIKE ?', '%'+@content1+'%')
      end

    elsif (@content1.blank? && @content2.present?)
      if @method2 == 'perfect'
        @posts = Post.where(address: @content2)
      else
        @posts = Post.where('address LIKE ?', '%'+@content2+'%')
      end

    elsif (@content1.present? && @content2.present?)
      if (@method1 == 'perfect' && @method2 == 'perfect')
        @posts = Post.where(cooking_name: @content1, address: @content2)

      elsif (@method1 == 'perfect' && @method2 == 'partial')
        @posts = Post.where(cooking_name: @content1).where('address LIKE ?', '%'+@content2+'%')

      elsif (@method1 == 'partial' && @method2 == 'perfect')
        @posts = Post.where('cooking_name LIKE ?', '%'+@content1+'%').where(address: @content2)

      else
        @posts = Post.where('cooking_name LIKE ? AND address LIKE ?', '%'+@content1+'%', '%'+@content2+'%')
      end

    end
  end

end
