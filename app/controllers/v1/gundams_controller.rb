class V1::GundamsController < ApplicationController
    def index
        if @gundams = Gundam.all 
            render json: { message: "OK", response: @gundams}, status: :ok
        else
            render json: { message: "INTERNAL SERVER ERROR", response: null}, status: :ok
        end
    end

    def create
        @gundam = Gundam.new(gundam_params)

        if @gundam.save
            render json: { message: "OK", response: @gundam}, status: :ok
        else
            render json: { message: "INTERNAL SERVER ERROR", response: null}, status: :ok
        end
    end

    def update
        @gundam = Gundam.find(params[:id])

        if @gundam.present?
            if @gundam.update(gundam_params)
                render json: { message: "OK", response: @gundam}, status: :ok
            else
                render json: { message: "INTERNAL_SERVER_ERROR", response: null}, status: 500    
            end
        else
            render json: { message: "NOT_FOUND", response: null}, status: 404
        end
    end

    def destroy
        @gundam = Gundam.find(params[:id])

        if @gundam.present?
            if @gundam.destroy
                head(:ok)
            else
                head(:unprocessable_entity)
            end
        end
    end

    private def gundam_params
        params.require(:gundam).permit(:name, :year, :story)
    end
end
