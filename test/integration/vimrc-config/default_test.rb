title "Default role integrated test file"

describe file('/home/kitchen/.vimrc') do
  it { should exist }
  its('mode') { should cmp '0664' }

  its('content') { should match("set nocompatible") }
  its('content') { should match("call vundle#begin") }
  its('content') { should match("call vundle#end") }
end
