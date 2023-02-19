# Create a file "index.html" directly from a task to the machine.
directory '/tmp/copy_file' do
    recursive true
  end
  
  directory '/tmp/create_file' do
    recursive true
  end

  file "Create a file" do
    content "<html>This is a placeholder for the home page.</html>"
    group "root"
    mode "0755"
    owner "ec2-user"
    path "/tmp/create_file/index.html"
  end
  # Copy the "index.html" from /tmp/create_file/index.html to /tmp/copy_file/index.html
  remote_file '/tmp/copy_file/index.html' do
    source 'file:///tmp/create_file/index.html'
  end

  # Copy a file from Subdirectory "Files" in the cookbooks to another place on the machine.
  cookbook_file "Copy a file" do  
    group "root"
    mode "0755"
    owner "ec2-user"
    path "/tmp/create-directory-demo/hello.txt"
    source "hello.txt"  
  end