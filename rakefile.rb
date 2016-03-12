
SUFFIX = {
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
  puts "---- Language: #{lang}"
  Dir.chdir(lang) do
    case lang
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
end

LANGS = %w(crystal d nim pascal rust vala)

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
