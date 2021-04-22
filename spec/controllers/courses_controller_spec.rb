require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:course) { create(:course) }
  
  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:index) }

    it 'assigns the list of courses to @courses' do
      subject
      expect(assigns(:courses)).to eq [course]
    end
  end

  describe 'GET #show' do
    subject { get :show, id: course }

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:show) }

    it 'assigns the expected course to @course' do
      subject
      expect(assigns(:course)).to eq course
    end
  end

  describe 'PUT #update' do
    context 'when valid course attributes are supplied' do
      subject { put :update, id: course, course: attributes_for(:course, name: 'Newer Course 101') }

      it 'redirects to the course once saved' do
        is_expected.to redirect_to course
      end

      it 'saves the course details' do
        expect{ subject }.to change{ course.reload.name }.to('Newer Course 101')
      end
    end

    context 'when invalid course attributes are supplied' do
      subject { put :update, id: course, course: attributes_for(:course, name: nil) }
      
        it 'does not save the course details' do
          expect{ subject }.not_to change{ course.reload.name }
        end
    end  
  end

end
