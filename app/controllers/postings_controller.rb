class PostingsController < InheritedResources::Base
  before_filter :set_posting, only: [:destroy, :update]
  
  def index
    @postings = Posting.all
  end

  def new
    @posting = Posting.new
    @posting.images.build
  end

  def edit
    @posting.images.new
  end

  def create
    # TODO: change to current user
    @posting = Posting.new(posting_params)
    if @posting.save
      if params[:image_attributes]
        params[:image_attributes].each do |image|
          @posting.images.create(name: image[:name])
        end
      end
      redirect_to @posting, notice: 'Posting was created'
    else
      redirect_to new_posting_path, notice: 'Posting was not created'
    end
  end

  def update
    if params[:image_attributes]
      params[:image_attributes].each do |image| 
        @posting.images.create(name: image[:name]) 
      end
      redirect_to @posting, notice: 'Posting was updated'
    else
      redirect_to edit_posting_path(@posting), notice: "Posting was not updated. These errors occured: #{@posting.errors}"
    end
  end

  def destroy
    @posting.destroy 
    redirect_to postings_url, notice: 'Posting was removed'
  end

  private

  def set_posting
    @posting = Posting.find(params[:id])
  end

  def posting_params
    params.require(:posting).permit(
      :title, :description, image_attributes: [:name, :posting_id]
    )
  end
end
