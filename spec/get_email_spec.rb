require_relative '../lib/get_email'

describe "the get_cityhalls_urls method" do
  it "should return all the cityhalls urls in a hash associated to the names as keys" do
    expect(get_cityhalls_urls("http://www.annuaire-des-mairies.com/val-d-oise.html")).not_to be_nil
    expect(get_cityhalls_urls("http://www.annuaire-des-mairies.com/val-d-oise.html").length).to be > 5
    expect(get_cityhalls_urls("http://www.annuaire-des-mairies.com/val-d-oise.html").length).to be < 400
  end
end

describe " the get_cityhall_email method" do
  it " should return the cityhall email from the cityhall url" do
    expect(get_cityhall_email("http://www.annuaire-des-mairies.com/95/haravilliers.html")).to eq("commune.haravilliers@orange.fr")
    expect(get_cityhall_email("http://www.annuaire-des-mairies.com/95/goussainville.html")).to eq("maire@ville-goussainville.fr")
  end
end

describe " the perform method" do
  it " should combine both previous method in an array of {city,cityemail}" do
    expect(perform("http://www.annuaire-des-mairies.com/val-d-oise.html").length).to eq(get_cityhalls_urls("http://www.annuaire-des-mairies.com/val-d-oise.html").length)
    expect(perform("http://www.annuaire-des-mairies.com/val-d-oise.html")[0]).to eq({ "ABLEIGES" => "mairie.ableiges95@wanadoo.fr" })
  end
end
