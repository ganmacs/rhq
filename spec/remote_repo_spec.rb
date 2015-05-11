require 'rhq/remote_repo'

describe Rhq::RemoteRepo do
  let(:repo) { described_class.new(path, ssh) }
  before { allow(Rhq::Url).to receive(:root_path).and_return(STUB_ROOT_PATH) }

  shared_examples_for 'remote path' do
    context 'without ssh flg' do
      let(:ssh) { false }
      it 'has remote path' do
        expect(repo.url).to eq 'https://github.com/ganmacs/rhq'
      end
    end

    context 'with ssh flg' do
      let(:ssh) { true }
      it 'has remote path' do
        expect(repo.url).to eq 'git@github.com:ganmacs/rhq'
      end
    end
  end

  describe 'Receive relative path' do
    let(:path) { 'ganmacs/rhq' }
    it_should_behave_like 'remote path'
  end

  describe 'Receive url format path' do
    let(:path) { 'https://github.com/ganmacs/rhq' }
    it_should_behave_like 'remote path'
  end

  describe 'Receive url format path with .git' do
    let(:path) { 'https://github.com/ganmacs/rhq.git' }
    it_should_behave_like 'remote path'
  end
end
