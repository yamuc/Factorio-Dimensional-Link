--[[
Desmos Graph of base function:
    https://www.desmos.com/calculator/kdzhxzeweo 

Randomized Starting Values:
    v: 1-2
        The amplitude of the wave
        A = v * (mults on i, j, k and l)
        using v so that the mults can be changed easier
         - although still hard-coded

    h: 5-10
        The height of the wave
         - Where the trig functions are centered on

    a: .1-2
        Serves as the overall shape of the wave & how slow it varies

    b: 2-10
    c: 2-10
        Serve as the "randomness" behavior I like
         - must be >= r away from each other
          - can easily do a re-randomize while |b-a| < r

        r: 1-2?
            can't model in desmos so need to expirement with this
            if r is too small the wave can get very predictable

    d: 10-20
        Finer variations
         - Could add more trig functions but I think this works for now
]]