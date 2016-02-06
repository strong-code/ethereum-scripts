script_name = "#{ARGV[0]}.rb"

boilerplate = "def persist(results)\n  #\nend\n\ndef log(level, data)\n  #\nend\n\ndef run()\n  #\nend\n\nrun()"

File.open(script_name, 'w') { |f| f.write(boilerplate) }

puts "Created new #{script_name} script under /scripts/#{script_name}"
