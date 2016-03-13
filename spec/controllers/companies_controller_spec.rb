RSpec.describe CompaniesController, type: :controller do
  describe 'GET #index' do
    it 'allows access' do
      get :index
      expect(response).to be_succes
    end
  end

  describe 'Company #create' do
    context 'with valid attributes' do
      it 'creates company' do
        post :create, company: FactoryGirl.attributes_for(:company)
        expect(Company.count).to eq 1
      end
    end
    context 'with invalid attributes' do
      it 'does not create company' do
        company = FactoryGirl.build(:company, name: nil)
        expect(Company.count).to eq 0
      end
    end
  end

  describe 'Company #update' do
    context 'with valid attributes' do
      it 'updates company' do
        company = FactoryGirl.create(:company)
        patch :update, id: company.id, company: { name: "Edited" }
        company.reload
        expect(company.name).to eql "Edited"
      end

      it 'redirects to show company' do
        company = FactoryGirl.create(:company)
        patch :update, id: company.id, company: { name: "Edited" }
        expect(response).to redirect_to(company_path(company))
      end
    end

    context 'with invalid attributes' do
      it 'renders the edit screen again with errors if the model doesn\'t save' do
        company = FactoryGirl.create(:company)
        patch :update, id: company.id, company: { name: nil }
        expect(response).to render_template("edit")
      end
    end
  end
end