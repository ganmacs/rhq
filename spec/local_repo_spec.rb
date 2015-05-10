require 'rhq/local_repo'

describe Rhq::LocalRepo do
  let(:repo) { described_class.new(path) }

  shared_examples_for 'has some type paths' do
    it 'has full path' do
      expect(repo.full_path).to eq '/Users/ganmacs/src/github.com/ganmacs/rhq'
    end

    it 'has relative path' do
      expect(repo.rel_path).to eq 'github.com/ganmacs/rhq'
    end

    it 'has path parts' do
      expect(repo.path_parts).to eq ['github.com/ganmacs/rhq', 'ganmacs/rhq', 'rhq']
    end
  end

  describe 'Receive relative path' do
    let(:path) { 'ganmacs/rhq' }
    it_should_behave_like 'has some type paths'
  end

  describe 'Receive url format path' do
    let(:path) { 'https://github.com/ganmacs/rhq' }
    it_should_behave_like 'has some type paths'
  end

  describe 'Receive url format path with .git' do
    let(:path) { 'https://github.com/ganmacs/rhq.git' }
    it_should_behave_like 'has some type paths'
  end

  describe 'Receive full path' do
    let(:path) { '/Users/ganmacs/src/github.com/ganmacs/rhq' }
    let(:repo) { described_class.new_from_full_path(path) }
    it_should_behave_like 'has some type paths'
  end
end
