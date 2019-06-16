Base.eltype(::Type{Rational{T}}) where {T} = T
Base.eltype(::Type{FastRational{T,H}}) where {T,H} = T
Base.eltype(x::Rational{T}) where {T} = T
Base.eltype(x::FastRational{T,H}) where {T,H} = T


function fast_sumstoward_half(::Type{T}, n) where {T}
    onethird = FastRational(one(eltype(T)) //  3*one(eltype(T)))
    a1 = onethird; a2 = a1*a1; s = a1 + a2; t = a2*a1; s=s+t
    while n>0
      n = n - 1
      t = t * a1
      s = s + t
    end
    return s, t
end

function sums_toward_half(::Type{T}, n) where {T}
    onethird = (one(eltype(T)) //  3*one(eltype(T)))
    a1 = onethird; a2 = a1*a1; s = a1 + a2; t = a2*a1; s=s+t
    while n>0
     n = n - 1
     t = t * a1
     s = s + t
    end
    return s, t
end


sums_toward_half(Rational{Int64},17)
# (1743392200//3486784401, 1//3486784401)

sums_toward_half(FastRational{Int64},17)

