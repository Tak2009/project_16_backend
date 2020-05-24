class PubsController < ApplicationController
    
    def index
        pubs = Pub.all
        render json: pubs, include: [:tickets] # added tickets 
        # render plain: "hello world"
    end

    def create
        pub = Pub.new(pub_params)
    
        if pub.save
          render json: pub, status: :created
        else
          render json: pub.errors, status: :unprocessable_entity
        end
      end

    private
    def pub_params
    params.require(:pub).permit!
    end
end
