using Oscar

R, x = polynomial_ring(QQ, "x")

f = x^2 - 1

factor(f)

##########Facciamo qualche prova un po' più complicata######

function borel_weil_bott(l::Vector{<:Integer}) 
    #dimensione
    n = length(l)  

    #creazione del peso 
    r = collect(n-1:-1:0) 
    s = l + r 
 
    #verifica aciclicità/immacolatezza
    if !allunique(s)
        return (0, 0) 
    end

    #calcolo del grado 
    deg = 0

    for i in 1:n
        for j in i+1:n
            if s[i] < s[j]
                deg += 1
            end
        end
    end

    #calcolo dimensione
    s_sorted = sort(s, rev=true)
    dominant = s_sorted - r

    dim=1

    for i in 1:n 
        for j in i+1:n 
            num = dominant[i]-dominant[j]+j-i
            den = j-i
            dim = div(dim*num,den)
        end
    end

    return (deg,dim)
end