require 'rails_helper'

describe 'words API', type: :request do 
    
    before do
       
        FactoryBot.create(:word, word: 'test', meaning: 'mean',favourite: 'yes' )
        FactoryBot.create(:word, word: 'test1', meaning: 'mean1',favourite: 'no')
    end 

    describe 'GET /words' do
        it 'return all words' do
            get '/words' 
            expect(response).to have_http_status(:success) 
            expect(JSON.parse(response.body).size).to eq(2) 
            
        end
    end

    describe 'POST /words/new' do
        it 'creates a new word' do
            
            expect { 
                post '/words/new', params: { word: { word: 'test2', meaning: 'mean2',favourite: 'no' } }
            }.to change { User.count }.by(+1)

            expect(response).to have_http_status(:created)
        end

       
        context 'When saving fails' do 
            before do
               
                allow_any_instance_of(User).to receive(:save).and_return(false)
            end
        
            it 'It should respond as unprocessable_entity' do
                post '/words/new', params: { words: {  word: 'test3', meaning: 'mean3',favourite: 'yes1' } }
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end

    describe 'GET /words/1' do
        it 'return word with specific ID' do 
            get '/words/1'
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body)['id']).to eq(1) 
        end
    end


   
end