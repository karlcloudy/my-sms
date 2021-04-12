require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:student) { create(:student) }

  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:index) }

    it 'assigns the list of students to @students' do
      subject
      expect(assigns(:students)).to eq [student]
    end
  end

  describe 'GET #show' do
    subject { get :show, id: student }

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:show) }

    it 'assigns the expected student to @student' do
      subject
      expect(assigns(:student)).to eq student
    end
  end

  describe 'GET #edit' do
    subject { get :edit, id: student }

    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:edit) }

    it 'assigns the expected student to @student' do
      subject
      expect(assigns(:student)).to eq student
    end
  end  

  describe 'PUT #update' do
    context 'when valid student attributes are supplied' do
      subject { put :update, id: student, student: attributes_for(:student, email: 'jennifer@example.org') }

      it 'redirects to the student once saved' do
        is_expected.to redirect_to student
      end

      it 'saves the student details' do
        expect{ subject }.to change{ student.reload.email }.to('jennifer@example.org')
      end
    end

    context 'when invalid student attributes are supplied' do
      subject { put :update, id: student, student: attributes_for(:student, email: nil) }
      
        it 'does not save the student details' do
          expect{ subject }.not_to change{ student.reload.email }
        end
    end  
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, id: student }

    it 'redirects to the student list upon deletion' do
      is_expected.to redirect_to students_path
    end

    it 'deletes the expected student' do
      subject
      expect { student.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end  
end
