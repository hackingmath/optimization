#= From Bosch, Opt Art Ch. 3
a = chairs, b = tables, c = sofaborde
Revenue: r_a = 8, r_b = 11, r_c = 15
a takes 2 large, 1 small
b takes 2 large, 2 small
c takes 2 large, 3 small
June 8, 2020
=#

function optimize(reva,revb,revc,a1,b1,c1,a2,b2,c2,max1,max2)
    #= 3 types of product, their revenues
    and how many of ingredients 1 and 2 they use
    maximum of ingredients 1 and 2 available =#
    record = 0
    record_a, record_b, record_c = 0,0,0
    maxa = min(max1÷a1,max2÷a2)
    for a in 0:maxa
        maxb = min(max1÷b1,max2÷b2)
        for b in 0:maxb
            maxc = min(max1÷c1,max2÷c2)
            for c in 0:maxc
                rev = reva*a + revb*b + revc*c 
                if a1*a + b1*b + c1*c > max1
                    continue
                end
                if a2*a + b2*b + c2*c > max2
                    continue
                end
                if rev > record
                    record = rev
                    record_a, record_b, record_c = a,b,c
                end
            end
        end
    end
    record_a,record_b,record_c,record
end

println(optimize(8,11,15,2,2,2,1,2,3,25,19))
