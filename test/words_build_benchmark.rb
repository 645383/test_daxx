require 'benchmark'
require 'words'

class WordsBench
  def self.run
    dict = Dictionary.new
    dict.load_file File.join __dir__, '..', 'dictionary.txt'

    new_words1 = Words.new(6686787825, dict)
    new_words2 = Words.new(2282668687, dict)
    new_words3 = Words.new(2282668799, dict)

    Benchmark.bm do |x|
      x.report("6686787825:") { new_words1.build }
      x.report("2282668687:") { new_words2.build }
      x.report("2282668799:") { new_words3.build }
    end
  end
end
