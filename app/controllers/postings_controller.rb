class PostingsController < InheritedResources::Base
  def index
    @postings = Posting.all
  end

  def create
  end

  def destroy
  end

  def update
  end

  private

  def posting_params
    params.require(:posting).permit(:title, :description)
  end
end
