import numpy as np
import scipy.io as si
import matplotlib.pyplot as plt

data_adv = si.loadmat('Loc_GenStats_ReStr.mat') #ADV results
adv = data_adv["Loc_GenStats_ReStr"]
del data_adv

cfd = np.loadtxt('CFDResult.txt', unpack=True) #OpenFOAM results
cfd = np.transpose(cfd)

x_unique = np.unique(cfd[:,0])

fig, ax = plt.subplots(2,10, sharey=True)
ax = ax.ravel()
for i in range(0,len(x_unique)):
    expt = []; expt_z = []
    comp = []; comp_z = []
    for j in range(0, len(cfd)):
        if x_unique[i] == adv[j,0]:
            expt.append(adv[j,3])
            expt_z.append(adv[j,2])
        if x_unique[i] == cfd[j,0]:
            comp.append(cfd[j,3])
            comp_z.append(cfd[j,2])
    
    #ax[i].subplot(2, 10, i+1)
    ax[i].plot(expt, expt_z, label = "ADV",linewidth=0.5, marker='o')
    ax[i].plot(comp, expt_z, label = "CFD",linewidth=0.5, marker = 'o')
    ax[i].set_title('z=%.3f (m)' %(x_unique[i]), fontsize=9)
    ax[i].legend(loc='best', prop={'size':8}, frameon=True, shadow=True, framealpha=0.5)
	#plt.xlabel("u")
    #plt.ylabel("z")
    #plt.legend(loc='best')
    #plt.axes().set_aspect(0.5)
    #plt.title('z=%f (m)' %(x_unique[i]))
    #plt.show()
plt.show()