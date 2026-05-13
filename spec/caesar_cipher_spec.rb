require_relative '../caesar_cipher'

describe 'caesar_cipher' do
  describe 'valid_inputs?' do
    before do
      allow($stdout).to receive(:puts)
    end
    context 'when both arguments are not valid' do
      it 'returns false' do
        expect(valid_inputs?(25, 'hi')).to be false
      end
      it 'prints error message' do
        expect($stdout).to receive(:puts).with('Wrong input!')
        valid_inputs?(25, 'hi')
      end
    end
    context 'when one of the arguments is not valid' do
      it 'returns false' do
        expect(valid_inputs?('hi', 'hello')).to be false
      end
      it 'prints error message' do
        expect($stdout).to receive(:puts).with('Wrong input!')
        valid_inputs?('hi', 'hello')
      end
    end
    context 'when both arguments are valid' do
      it 'returns true' do
        expect(valid_inputs?('hi', 15)).to be true
      end
      it "doesn't print anything" do
        expect($stdout).not_to receive(:puts)
      end
    end
  end
  describe 'alphabetic?' do
    context 'when argument is a number' do
      it 'return false' do
        expect(alphabetic?(65)).to be false
      end
    end
    context 'when argument is array' do
      it 'return false' do
        expect(alphabetic?([1, 2, 3])).to be false
      end
    end
    context 'when argument is empty string' do
      it 'raises ArgumentError' do
        expect { alphabetic?('') }.to raise_error(ArgumentError)
      end
    end
    context 'when argument is alphabetic' do
      it 'returns true' do
        expect(alphabetic?('s')).to be true
      end
    end
  end
end
