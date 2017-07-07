import numpy as np
import scipy.io as si
import matplotlib.pyplot as plt

adv = si.loadmat('Loc_GenStats_ReStr.mat')

u_adv = adv["Loc_GenStats_ReStr"][:,3]
v_adv = adv["Loc_GenStats_ReStr"][:,4]
w_adv = adv["Loc_GenStats_ReStr"][:,5]
del adv

x, y, z, u_cfd, v_cfd, w_cfd = np.loadtxt('CFDResult.txt', unpack=True)
del x, y, z

#U Velocity Plot
fig, ax = plt.subplots()
ax.scatter(u_adv, u_cfd, marker='o', s=25, alpha=0.5)
ax.set_xlabel("U Velocity: ADV")
ax.set_ylabel("U Velocity: OpenFOAM")
#ax.set_xlim((-0.6, 1))
#ax.set_ylim((-0.6, 1))
ax.set_aspect('equal')
lims = [
    np.min([ax.get_xlim(), ax.get_ylim()]),  # min of both axes
    np.max([ax.get_xlim(), ax.get_ylim()]),  # max of both axes
]
ax.plot(lims, lims, 'k-', alpha=0.5, zorder=0)

#V Velocity Plot
fig, ax = plt.subplots()
ax.scatter(v_adv, v_cfd, marker='o', s=25, alpha=0.5)
ax.set_xlabel("V Velocity: ADV")
ax.set_ylabel("V Velocity: OpenFOAM")
#ax.set_xlim((-0.6, 1))
#ax.set_ylim((-0.6, 1))
ax.set_aspect('equal')
lims = [
    np.min([ax.get_xlim(), ax.get_ylim()]),  # min of both axes
    np.max([ax.get_xlim(), ax.get_ylim()]),  # max of both axes
]
ax.plot(lims, lims, 'k-', alpha=0.5, zorder=0)

#W Velocity Plot
fig, ax = plt.subplots()
ax.scatter(w_adv, w_cfd, marker='o', s=25, alpha=0.5)
ax.set_xlabel("W Velocity: ADV")
ax.set_ylabel("W Velocity: OpenFOAM")
#ax.set_xlim((-0.6, 1))
#ax.set_ylim((-0.6, 1))
ax.set_aspect('equal')
lims = [
    np.min([ax.get_xlim(), ax.get_ylim()]),  # min of both axes
    np.max([ax.get_xlim(), ax.get_ylim()]),  # max of both axes
]
ax.plot(lims, lims, 'k-', alpha=0.5, zorder=0)


plt.show()