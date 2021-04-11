class KittensController < ActionController::Base
    def index
        @kittens = Kitten.all 
        respond_to do |format|
            format.html
            format.json { render :json => @kittens }
        end
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
                format.html { render :new, notice: "You messed up! Try again." }
            end
        end
    end

    def show
        @kitten = Kitten.find(params[:id])
        respond_to do |format|
            format.html
            format.json { render :json => @kitten }
        end
    end

    def edit
        @kitten = Kitten.find(params[:id])        
    end

    def update
        @kitten = Kitten.find(params[:id])
        @kitten.update(name: params[:kitten][:name], age: params[:kitten][:age], cuteness: params[:kitten][:cuteness], softness: params[:kitten][:softness])
        redirect_to @kitten, notice: "Kitten successfully updated."
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy
        respond_to do |format|
            format.html { redirect_to root_path, notice: "Kitten successfully deleted." }
        end
    end

    private

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end