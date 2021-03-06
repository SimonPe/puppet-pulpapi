require 'spec_helper_acceptance'

describe 'Mirror definitions' do
  include_examples 'the example', 'mirrors.pp'

  let(:purge_repos) do
    <<-EOS
    class { '::pulpapi':
      purge_repos => true,
    }
    EOS
  end

  it 'purges repos' do
    apply_manifest(purge_repos, catch_failures: true)
  end
end
