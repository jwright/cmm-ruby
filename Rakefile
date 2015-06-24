desc "Displays the word count for a specific file"
task :count_words, :filename do |t, args|
  require "./lib/word_counter"

  filename = args[:filename] || "example_text.txt"

  text = File.read filename

  WordCounter.new(text).count_words.each do |word, count|
    puts "'#{word}' appears #{count} time#{count == 1 ? "" : "s"}"
  end
end
