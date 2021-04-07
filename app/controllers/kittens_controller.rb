class KittensController < ActionController::Base
    def index
        @kittens = Kitten.all 
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)
        respond_to do |format|
            if @kitten.save
                format.html { redirect_to @kitten, notice: "You created a new kitten!" }
            else
                format.html { render :new }
            end
        end
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def edit
        @kitten = Kitten.find(params[:id])        
    end

    def update
        @kitten = Kitten.find(params[:id])
        @kitten.update(name: params[:name], age: params[:age], cuteness: params[:cuteness], softness: params[:softness])
        redirect_to kitten_path(@kitten)
    end

    private

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end