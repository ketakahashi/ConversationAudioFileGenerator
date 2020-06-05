if ARGV.size == 0
   puts "Usage: ruby kaiwa.rb filename"
   exit(0)
end

open ARGV[0],"r" do |f|
  s=[]
  f.each do |l|
    n,m=l.split(':')
    system("say -v #{n} #{m.chomp} -o #{s.size}.aiff")
    s << "#{s.size}.aiff"
  end
  system("sox #{s.join(' ') } #{ARGV[0]}.mp3") 
  system("rm #{s.join(' ')}")
end
