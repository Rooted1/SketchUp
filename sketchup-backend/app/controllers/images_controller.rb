class ImagesController < ApplicationController

    def index
        images = Image.all 
        render(json: images, :methods => :url, include: [:user])

    end

    def create
        image = Image.create(
            title: params[:newImageTitle],
            image: params[:newImage],
            user_id: current_user.id
        )
    end 

    def show
        image = Image.find(params[:id])
        # render(json: image, include: :user)
        render(json: image, :methods => :url, include: [:user])
    end

    def destroy
        image = Image.find(params[:id])
        image.delete
    end

    # def create
    #     image = Image.create (
    #         title: params[:title],
    #         image: params[:image]
    #     )
    # end 
end
