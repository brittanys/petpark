require 'rails_helper'
RSpec.describe PostingsController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  describe 'GET #index' do
    it 'assigns all postings as @postings' do
      posting = Posting.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:postings)).to eq([posting])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested posting as @posting' do
      posting = Posting.create! valid_attributes
      get :show, { id: posting.to_param }, valid_session
      expect(assigns(:posting)).to eq(posting)
    end
  end

  describe 'GET #new' do
    it 'assigns a new posting as @posting' do
      get :new, {}, valid_session
      expect(assigns(:posting)).to be_a_new(Posting)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested posting as @posting' do
      posting = Posting.create! valid_attributes
      get :edit, { id: posting.to_param }, valid_session
      expect(assigns(:posting)).to eq(posting)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Posting' do
        expect do
          post :create, { posting: valid_attributes }, valid_session
        end.to change(Posting, :count).by(1)
      end

      it 'assigns a newly created posting as @posting' do
        post :create, { posting: valid_attributes }, valid_session
        expect(assigns(:posting)).to be_a(Posting)
        expect(assigns(:posting)).to be_persisted
      end

      it 'redirects to the created posting' do
        post :create, { posting: valid_attributes }, valid_session
        expect(response).to redirect_to(Posting.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved posting as @posting' do
        post :create, { posting: invalid_attributes }, valid_session
        expect(assigns(:posting)).to be_a_new(Posting)
      end

      it "re-renders the 'new' template" do
        post :create, { posting: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end
      let(:posting) { Posting.create! valid_attributes }
      let(:valid_parameters) do
        { id: posting.to_param, posting: valid_attributes }
      end

      it 'updates the requested posting' do
        parameters = { id: posting.to_param, posting: new_attributes }
        put :update, parameters, valid_session
        posting.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested posting as @posting' do
        put :update, valid_parameters, valid_session
        expect(assigns(:posting)).to eq(posting)
      end

      it 'redirects to the posting' do
        put :update, valid_parameters, valid_session
        expect(response).to redirect_to(posting)
      end
    end

    context 'with invalid params' do
      let(:posting) { Posting.create! invalid_attributes }
      let(:valid_parameters) do
        { id: posting.to_param, posting: valid_attributes }
      end
      it 'assigns the posting as @posting' do
        invalid_params = { id: posting.to_param, posting: invalid_attributes }
        put :update, invalid_params, valid_session
        expect(assigns(:posting)).to eq(posting)
      end

      it "re-renders the 'edit' template" do
        put :update, valid_parameters, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested posting' do
      posting = Posting.create! valid_attributes
      expect do
        delete :destroy, { id: posting.to_param }, valid_session
      end.to change(Posting, :count).by(-1)
    end

    it 'redirects to the postings list' do
      posting = Posting.create! valid_attributes
      delete :destroy, { id: posting.to_param }, valid_session
      expect(response).to redirect_to(postings_url)
    end
  end
end
