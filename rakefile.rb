
SUFFIX = {
  c: 'c',
  crystal: 'cr',
  d: 'd',
  go: 'go',
  nim: 'nim',
  pascal: 'pas',
  rust: 'rs',
  swift: 'swift',
  vala: 'vala',
}
LANGS = SUFFIX.keys.map &:to_s

def run(lang, command, args = [])
  sfx = SUFFIX[lang.to_sym] or raise "Unknown language: #{lang}"
  fname = "#{command}.#{sfx}"
  puts green("---- Language: #{lang}")
  Dir.chdir(lang) do
    raise "No such file: #{fname}" unless File.exist?(fname)

    case lang
    when "c"
      sh "gcc", "-o", command, fname
    when "crystal"
      sh "crystal", "build", fname
    when "d"
      sh "dmd", fname
    when "go"
      sh "go", "build", fname
    when "nim"
      sh "nim", "compile", "--hints:off", fname
    when "pascal"
      sh "fpc", "-v0", fname
    when "rust"
      sh "rustc", fname
    when "swift"
      sh "swiftc", fname
    when "vala"
      sh "valac", fname
    end
    sh "./#{command}", *args
  end

rescue => e
  puts yellow(e.message)
end

task :hello do
  LANGS.each do |lang|
    run lang, "hello"
  end
end

task :is_prime do
  LANGS.each do |lang|
    run lang, "is_prime", %w(1 2 3 4 5 6 7 8 9 10)
    # TODO support invalid arguments
    # run lang, "is_prime", %w(1 2 3 4 5 6 7 8 9 0 abc)
  end
end

task :oop do
  LANGS.each do |lang|
    run lang, "oop"
  end
end

def green(str)
  "\e[32m#{str}\e[0m"
end

def yellow(str)
  "\e[33m#{str}\e[0m"
end
