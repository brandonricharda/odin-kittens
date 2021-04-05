class KittensController < ActionController::Base
    def index
        @kittens = Kitten.all 
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)
        # Need to add further code
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def edit
        @kitten = Kitten.find(params[:id])        
    end

    def update
        @kitten = Kitten.find(params[:id])
        # Need to add further code
    end

    private

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end