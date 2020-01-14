title "vimrc configuration"

describe file('/home/kitchen/.vimrc') do
  it { should_not exist }
end
