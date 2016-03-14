
SUFFIX = {
  c: 'c',
  crystal: 'cr',
  d: 'd',
  nim: 'nim',
  pascal: 'pas',
  rust: 'rs',
  vala: 'vala',
}

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
    when "nim"
      sh "nim", "compile", "--hints:off", fname
    when "pascal"
      sh "fpc", "-v0", fname
    when "rust"
      sh "rustc", fname
    when "vala"
      sh "valac", fname
    end
    sh "./#{command}", *args
  end

rescue => e
  puts yellow(e.message)
end

LANGS = %w(c crystal d nim pascal rust vala)

task :hello do
  LANGS.each do |lang|
    run lang, "hello"
  end
end

task :is_prime do
  LANGS.each do |lang|
    run lang, "is_prime", %w(1 2 3 4 5 6 7 8 9 10)
  end
end

def green(str)
  "\e[32m#{str}\e[0m"
end

def yellow(str)
  "\e[33m#{str}\e[0m"
end
