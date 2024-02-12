class VocabulariesController < ApplicationController
  before_action :set_vocabulary, only: %i[ show edit update destroy ]

  # GET /vocabularies
  def index
    @vocabularies = Vocabulary.all
  end

  # GET /vocabularies/1
  def show
  end

  # GET /vocabularies/new
  def new
    @vocabulary = Vocabulary.new
  end

  # GET /vocabularies/1/edit
  def edit
  end

  # POST /vocabularies
  def create
    @vocabulary = Vocabulary.new(vocabulary_params)

    if @vocabulary.save
      redirect_to @vocabulary, notice: "Vocabulary was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vocabularies/1
  def update
    if @vocabulary.update(vocabulary_params)
      redirect_to @vocabulary, notice: "Vocabulary was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /vocabularies/1
  def destroy
    @vocabulary.destroy!
    redirect_to vocabularies_url, notice: "Vocabulary was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vocabulary
      @vocabulary = Vocabulary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vocabulary_params
      params.require(:vocabulary).permit(:word, :translation, :context, :user_id)
    end
end
