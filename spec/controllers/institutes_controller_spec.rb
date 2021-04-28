require 'rails_helper'

RSpec.describe InstitutesController, type: :controller do
  let(:institute) { create(:institute) }
  
  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:index) }

    it 'assigns the list of institutes to @institutes' do
      subject
      expect(assigns(:institutes)).to eq [institute]
    end
  end

  describe 'GET #show' do
    subject { get :show, id: institute }

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:show) }

    it 'assigns the expected institute to @institute' do
      subject
      expect(assigns(:institute)).to eq institute
    end
  end

  describe 'PUT #update' do
    context 'when valid institute attributes are supplied' do
      subject { put :update, id: institute, institute: attributes_for(:institute, name: 'Awesomer Academy') }

      it 'redirects to the institute once saved' do
        is_expected.to redirect_to institute
      end

      it 'saves the institute details' do
        expect{ subject }.to change{ institute.reload.name }.to('Awesomer Academy')
      end
    end

    context 'when invalid institute attributes are supplied' do
      subject { put :update, id: institute, institute: attributes_for(:institute, name: nil) }
      
        it 'does not save the institute details' do
          expect{ subject }.not_to change{ institute.reload.name }
        end
    end  
  end
end
