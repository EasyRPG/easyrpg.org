# Adapted from https://github.com/blinry/morr.cc - Thanks blinry!

class TidyFilter < Nanoc::Filter
  require "open3"
  identifier :tidy
  type :text

  def run(content, params={})
    Open3.popen3("tidy --quiet yes --indent auto --indent-with-tabs --wrap 150 --tidy-mark no") do |stdin, stdout, stderr, wait_thr|
      stdin.print content
      stdin.close

      ret = ""

      err = Thread.new do
        print stderr.readlines.join
      end
      out = Thread.new do
        ret = stdout.readlines.join
      end

      err.join
      out.join
      return ret
    end
  end
end
