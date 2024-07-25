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

Mfunc = {}
function Mfunc:new (nCoef, coef)
    nCoef = nCoef or 0
    coef = coef or {}
    if(#coef ~= nCoef) then
        print("Coefficient count and lists do not match; Aborting.")  
        return nil
    end

    local o = {nCoef = nCoef, coef = coef}
    setmetatable(o, self)
    self.__index = self
    return o
end

-- Updates a coefficient
function Mfunc:setCoef(index, value)
    if (index > self.nCoef or index < 1) then
        print("Out of bounds error")
        return nil
    end
    local out = self.coef[index]
    self.coef[index] = value
    return out
end

function Mfunc:updateCoef(index, value)
    if (index > self.nCoef or index < 1) then
        print("Out of bounds error")
        return nil
    end
    local out = self.coef[index]
    self.coef[index] = out + value
    return out
end

-- param t: time based on ticks
-- Overide for class inherits
function Mfunc:calc (t)
    --[[
    local total = 0
    for i=1,self.nCoef do
        total = total + t*self.coef[i]
    end
    ]]
    local total = 0
    for i=1,self.nCoef do
        total = total + self.coef[i]
    end
    return total
end






local test = Mfunc:new(2, {1, 2})

if test == nil then
    print("nil")
else
    print(test:calc(1))
    print("Previous value: " .. test:setCoef(2, 5))
    print(test:calc(1))
end