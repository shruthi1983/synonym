class SynonymsController < ApplicationController
  before_action :set_synonym, only: [ :show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!
  # GET /synonyms or /synonyms.json
  def index
    @synonyms = Synonym.all
  end
  
  # GET /synonyms/1 or /synonyms/1.json
  def show
  end

  # GET /synonyms/new
  def new
    @synonym = Synonym.new
  end

  # GET /synonyms/1/edit
  def edit
  end

  # POST /synonyms or /synonyms.json
  def create
    @synonym = Synonym.new(synonym_params)

    respond_to do |format|
      if @synonym.save
        format.html { redirect_to synonym_url(@synonym), notice: "Synonym was successfully created." }
        format.json { render :show, status: :created, location: @synonym }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @synonym.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /synonyms/1 or /synonyms/1.json
  def update
    respond_to do |format|
      if @synonym.update(synonym_params)
        format.html { redirect_to synonym_url(@synonym), notice: "Synonym was successfully updated." }
        format.json { render :show, status: :ok, location: @synonym }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @synonym.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /synonyms/1 or /synonyms/1.json
  def destroy
    @synonym.destroy

    respond_to do |format|
      format.html { redirect_to synonyms_url, notice: "Synonym was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def upvote
    @synonym.upvote_from current_user
    redirect_to synonyms_path
  end

  def downvote
    @synonym.downvote_from current_user
    redirect_to synonyms_path 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_synonym
      @synonym = Synonym.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def synonym_params
      params.require(:synonym).permit(:English_word, :Kannada_meaning,:user_id)
    end
end
