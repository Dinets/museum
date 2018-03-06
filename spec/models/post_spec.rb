describe Post do
  let(:post) { build(:post) }
  context 'valid' do
    it 'should be saved' do
      post.save
      expect(post.errors.messages.size).to eql 0
    end
  end

  context 'invalid' do
    it 'should not be saved with empty title' do
      post.title = nil
      expect(post).not_to be_valid
    end

    it 'should not be saved with empty body' do
      post.body = nil
      expect(post).not_to be_valid
    end
  end
end