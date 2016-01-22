require "jekyll"
require "tmpdir"

GITHUB_REPONAME = "sethxd/sethxd.github.io"
GITHUB_REMOTE = "https://#{ENV['GH_TOKEN']}@github.com/#{GITHUB_REPONAME}"

desc "Generate blog files"
task :generate do
    Jekyll::Site.new(Jekyll.configuration({
        "source"      => ".",
        "destination" => "_site"
    })).process
end

desc "Generate and publish blog to gh-pages"
task :publish => [:generate] do
    fail "Not on Travis" if "#{ENV['TRAVIS']}" != "true"

    Dir.mktmpdir do |tmp|
        cp_r "_site/.", tmp

        Dir.chdir tmp

        system "git init"
        system "git config user.name 'sethxd'"
        system "git config user.email 'seth.dehaan@gmail.com'"

        system "git add ."
        message = "Site updated at #{Time.now.utc}"
        system "git commit -m #{message.inspect}"
        system "git remote add origin #{GITHUB_REMOTE}"
        system "git push --force origin master"
    end
end
