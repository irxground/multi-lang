
SUFFIX = {
  crystal: 'cr',
  d: 'd',
  nim: 'nim',
  pascal: 'pas',
  rust: 'rs',
}

def compile_and_run(compiler, fname, command, args)
  sh *Array(compiler), fname
  sh "./#{command}", *args
end

def run(lang, command, args)
  sfx = SUFFIX[lang.to_sym] or raise "Unknown language: #{lang}"
  fname = "#{command}.#{sfx}"
  puts "---- Language: #{lang}"
  Dir.chdir(lang) do
    case lang
    when "crystal"
      sh "crystal", "run", fname, "--", *args
    when "d"
      compile_and_run("dmd", fname, command, args)
    when "nim"
      sh "nim", "compile", "--hints:off", "--run", command, *args
    when "pascal"
      compile_and_run(["fpc", "-v0"], fname, command, args)
    when "rust"
      sh "cargo", "run", "-q", "--bin", command, *args
    end
  end
end

task :is_prime do
  langs = %w(crystal d nim pascal rust)
  langs.each do |lang|
    run lang, "is_prime", %w(1 2 3 4 5 6 7 8 9 10)
  end
end
