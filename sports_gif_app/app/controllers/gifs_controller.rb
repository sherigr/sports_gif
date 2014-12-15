class GifsController < ApplicationController

	def index
		@gifs = Gif.all 
		render json: @gifs
	end

	def show
		@gif = Gif.find(params[:id])
		render json: @gif
	end

	def new
		@gif = Gif.new
		render :new
	end


	# def index
	# 	@gifs = Gif.all 
	# 	respond_to do |format|
	# 		format.html { render :index }
	# 		format.json { render json: @gifs }
	# end

	# def show
	# 	@gif = Gif.find(params[:id])
	# 	respond_to do |format|
	# 		format.html { render :show}
	# 		format.json { render json: @gif }
	# 	end
	# end

	# def new
	# 	@gif = Gif.new
	# 	render :new
	# end

	# def create
	# 	@gif = Gif.new(gif_params)
	# 	respond_to do |format|
	# 		if @give.save
	# 			format.html { redirect_to gif_path(@gif) }
	# 			format.json { render :json @gif }
	# 		else
	# 			format.html { render :new }
	# 			format.json { render :json @gif }
	# 		end
	# 	end
	# end

	# def destroy
	# 	@gif = Gif.find(params[:id])
	# 	respond_to do |format|
	# 		@gif.destroy
	# 		format.html { redirect_to gif_path }
	# 		format.json { render :json @gif }
	# end




	private
		def gif_params
			params.require(:gif).permit(:content, :image_url, :author, :category)
		end

end