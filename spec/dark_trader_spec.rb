require_relative '../lib/dark_trader'

describe "the download_coinmarket method" do
  it "should download the coinmarket page (not nil)" do
    expect(download_coinmarket).not_to be_nil
  end
end

describe "the coin_name method" do
  it "should filter the page to grab all coins names into an array" do
    expect(coin_name(download_coinmarket)).not_to be_nil
    expect(coin_name(download_coinmarket).count).to be > 5
    expect(coin_name(download_coinmarket).count).to be < 100
  end
end

describe "the coin_value method" do
  it "should filter the page to grab all coins values into an array" do
    expect(coin_value(download_coinmarket)).not_to be_nil
    expect(coin_value(download_coinmarket).count).to be > 5
    expect(coin_value(download_coinmarket).count).to be < 100
  end
end

describe "the coin_hash method" do
  it "should merge into an array of hash both coin arrays" do
    expect(coin_hash(coin_value(download_coinmarket), coin_name(download_coinmarket))).not_to be_nil
    expect(coin_hash(coin_value(download_coinmarket), coin_name(download_coinmarket)).count).to eq((coin_value(download_coinmarket).count))
  end
end
