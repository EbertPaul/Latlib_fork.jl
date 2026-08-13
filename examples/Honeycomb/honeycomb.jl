using Revise
using Latlib
using GLMakie

# infinite Bravais lattice for triangular lattice is predefined in lattice/predefined_lattices.jl
infinite_lat = honeycomb

# define finite cluster
L = 4
W = 4
boundary = [L 0; 0 W]
fl = FiniteLattice(infinite_lat, boundary, true)

# define nearest neighbor OpSum of Heisenberg-Kitaev model
H = OpSum()
H += neighbor_interaction("SdotS", "J", fl; num_distance = 1)
H += lattice_interaction("SxSx", "KX", fl, 1, 2, [0, 0]) # connect 1st and 2nd site in the same unit cell
H += lattice_interaction("SySy", "KY", fl, 1, 2, [0, -1]) # connect 1st site in [0, 0] cell to 2nd site in [0, -1] cell
H += lattice_interaction("SzSz", "KZ", fl, 2, 1, [1, 0]) # connect 2nd site in [0, 0] cell to 1st site in [1, 0] cell



# print
GLMakie.activate!()
plot_opsum(H, fl)

