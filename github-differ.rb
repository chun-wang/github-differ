require "octokit"
require 'net/http'
require 'fileutils'

client = Octokit::Client.new \
  :client_id     => "Chunyu",
  :client_secret => "a12716d6dc70fae2367083fd095fd1ff8dd18cbd"

user = client.user 'Chunyu'

# GET /repos/:owner/:repo/compare/:base...:head

repo = Octokit.repo 'hustcer/hexo-theme-air'

comparer = repo.rels[:compare]
puts comparer.href
#puts repo

results = comparer.get :uri => {:base => "master", :head => "scapewang:master"}

results.data.files.each do |file|
	puts file.filename
end


dirname = File.dirname("directory/a.txt")
unless File.directory?(dirname)
  FileUtils.mkdir_p(dirname)
end

data = Net::HTTP.get_response(URI('https://raw.githubusercontent.com/hustcer/hexo-theme-air/c825fb4f8c0b3ffd01c27812ae240bee1930031f/layout/archive.ejs')).body

txt = File.open("directory/a.txt","w+")
txt.write(data);
txt.close();
