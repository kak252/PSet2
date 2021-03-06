function calculate_transcriptional_control_array(t::Float64,x::Array{Float64,1}, problem::Dict{String,Any})::Float64

    # initialize -
    u_variable = 0.0
    
    # alias elements of the species vector -
    mRNA = x[1]
    G = x[2]
    σ70 = x[3]

    # get stuff from the problem dictionary -
    E1 = problem["E1"]
    E2 = problem["E2"]
    R = problem["ideal_gas_constant_R"]
    T_K = problem["temperature_K"]
    KD = problem["inducer_dissociation_constant"]
    n = problem["inducer_cooperativity_parameter"]

    KB = 1.38*10^-23    #Boltzmann Constant [m^2kg/s^2K]
    # TODO: write u-varible function here 
    W1 = exp(-E1/(T_K*R))
    W2 = exp(-E2/(T_K*R))
    fI = σ70^n/(KD^n+σ70^n)

    u_variable = (W1+W2*fI)/(1+W1+W2*fI)

    # return -
    return u_variable
end