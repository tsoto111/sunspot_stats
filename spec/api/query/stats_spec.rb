require File.expand_path('spec_helper', File.dirname(__FILE__))

describe "stats component" do
  
  it "sends stats parameters to solr" do
    
    session.search Content do
      stat :visibility, :facet => :published_at
    end

    expect(connection).to have_last_search_including(:stats, "true")
    expect(connection).to have_last_search_including(:"stats.field", "visibility_f")
    expect(connection).to have_last_search_including(:"stats.facet", "published_at_d")
  end
  
end