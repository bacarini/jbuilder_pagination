require 'spec_helper'

describe 'Jbuilder#pages!' do
  context 'when there is pagination for collection' do
    let(:collection) { OpenStruct.new(current_page: 2, total_pages: 3, per_page: 1) }
    let(:response_json) { File.read("spec/fixtures/links.json").chomp }

    it "returns full link pagination" do
      expect(build_json_for(collection)).to eq(response_json)
    end
  end

  context 'when there is no pagination for collection' do
    let(:collection) { OpenStruct.new(current_page: 1, total_pages: 1) }

    it "returns empty link pagination" do
      expect(build_json_for(collection)).to eq("{}")
    end
  end

  context 'when collection is nil' do
    it "returns empty link pagination" do
      expect(build_json_for(nil)).to eq("{}")
    end
  end

  def build_json_for(collection)
    Jbuilder.encode do |json|
      json.links do
        json.pages! collection, url: "https://api.example.com/v1/servers"
      end
    end
  end
end
