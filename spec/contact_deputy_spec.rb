require_relative '../lib/contact_deputy'

describe "the get_deputy_infos method" do
  it "should return a string describing each deputy infos" do
    expect(get_cityhalls_urls("https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s").length).to be > 500
    expect(get_cityhalls_urls("https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s").length).to be < 700
  end
end