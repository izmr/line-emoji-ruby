RSpec.describe LineEmoji do
  it "has a version number" do
    expect(LineEmoji::VERSION).not_to be nil
  end

  it "encodes a text inclugin Line emoji" do
    text = 'Hello!(わーい)'
    expect(LineEmoji.encode(text)).to eq "Hello!\u{100001}"
  end
end
