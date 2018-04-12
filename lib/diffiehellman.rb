require 'colorize'

class Diffiehellman
    
    attr_writer :p, :⍺, :xa, :xb
    attr_reader :p, :⍺, :xa, :xb
    
    def initialize
        @p=0
        @⍺=0
        @xa=0
        @xb=0
        @ya=0
        @yb=0
        @k=0
	end
    
    def ya
        return @ya=(@⍺**@xa)%p
    end
    
    def yb
        return @yb=(@⍺**@xb)%p
    end
    
    def k
        k_a=0
        k_b=0
        k_a=(@yb**@xa)%@p
        k_b=(@ya**@xb)%@p
        if k_a==k_b
            @k=k_a
            return @k
        else
            puts "La clave compartida K no coincide".red
        end
    end
    
end

@test=Diffiehellman.new
    puts
    puts "PRÁCTICA: INTERCAMBIO DE CLAVES DE DIFFIE-HELLMAN"
    puts
    print "Introduzca el número primo p: "
    p=gets.chomp.to_i
    while p<=0
        system "clear"
        if p==0
            puts "El número primo no puede ser igual a 0".red
        else
            puts "El número primo no puede ser negativo".red
        end
        puts
        print "Introduzca el número primo p: "
        p=gets.chomp.to_i
    end
    @test.p=p
    print "Introduzca alpha ⍺: "
    ⍺=gets.chomp.to_i
    while ⍺>p
        system "clear"
        puts "El alpha ⍺ introducido es mayor a p".red
        puts
        print "Introduzca alpha ⍺: "
        ⍺=gets.chomp.to_i
    end
    @test.⍺=⍺
    print "Introduzca el secreto xa: "
    xa=gets.chomp.to_i
    @test.xa=xa
    print "Introduzca el secreto xb: "
    xb=gets.chomp.to_i
    @test.xb=xb
    print "Traza: p=#{@test.p}, ⍺=#{@test.⍺}, xa=#{@test.xa}, xb=#{@test.xb}, ya=#{@test.ya}, yb=#{@test.yb}, k=#{@test.k}"
    puts
    puts
