cd mPEGPDLLA_P72C16

packmol < packmol.inp


gmx editconf -f pdllanpt4nsp7c16multi.pdb -o pdllanpt4nsp7c16multi.gro -box 15 15 15 -c

gmx solvate -cp pdllanpt4nsp7c16multi.gro -cs spc216.gro -p topol.top -o sol.gro

printf "2 | 3 | 4 | 5 | 6 \n name 11 polymer \n 11 | 7 \n name 12 polymer&drug \n q \n" | gmx make_ndx -f sol.gro -o index.ndx

gmx grompp -f em_real.mdp -c sol.gro -p topol.top -n index.ndx -o em.tpr -maxwarn 1
gmx mdrun -v -deffnm em

gmx grompp -f NVT.mdp -c em.gro -p topol.top -n index.ndx -o NVT.tpr -maxwarn 1 
gmx mdrun -deffnm NVT -nb gpu -v


gmx grompp -f NPT.mdp -c NVT.gro -t NVT.cpt -p topol.top -n index.ndx -o NPT.tpr -maxwarn 2
gmx mdrun -deffnm NPT -nb gpu -v

gmx grompp -f MD.mdp -c NPT.gro -t NPT.cpt -p topol.top -n index.ndx -o MD.tpr -maxwarn 2
gmx mdrun -deffnm MD -nb gpu -v

cd ..


cd mPEGPCL_P72C16

packmol < packmol.inp


gmx editconf -f pclnpt4nsp7c16multi.pdb -o pclnpt4nsp7c16multi.gro -box 15 15 15 -c

gmx solvate -cp pclnpt4nsp7c16multi.gro -cs spc216.gro -p topol.top -o sol.gro

printf "2 | 3 | 4 | 5 | 6 \n name 11 polymer \n 11 | 7 \n name 12 polymer&drug \n q \n" | gmx make_ndx -f sol.gro -o index.ndx

gmx grompp -f em_real.mdp -c sol.gro -p topol.top -n index.ndx -o em.tpr -maxwarn 1
gmx mdrun -v -deffnm em

gmx grompp -f NVT.mdp -c em.gro -p topol.top -n index.ndx -o NVT.tpr -maxwarn 1 
gmx mdrun -deffnm NVT -nb gpu -v


gmx grompp -f NPT.mdp -c NVT.gro -t NVT.cpt -p topol.top -n index.ndx -o NPT.tpr -maxwarn 2
gmx mdrun -deffnm NPT -nb gpu -v

gmx grompp -f MD.mdp -c NPT.gro -t NPT.cpt -p topol.top -n index.ndx -o MD.tpr -maxwarn 2
gmx mdrun -deffnm MD -nb gpu -v

cd ..

cd mPEGDSPE_P72C16

packmol < packmol.inp

gmx editconf -f dspenpt4nsp7c16multi.pdb -o dspenpt4nsp7c16multi.gro -box 15 15 15 -c

gmx solvate -cp dspenpt4nsp7c16multi.gro -cs spc216.gro -p topol.top -o sol.gro

gmx grompp -f ions.mdp -c sol.gro -p topol.top -o solion.tpr

printf "7 \n" | gmx genion -s solion.tpr -o solion.gro -p topol.top -pname NA -nname CL -neutral

printf "2 | 3 | 4 \n name 12 polymer \n 12 | 5 \n name 13 polymer&drug \n 8|10 \n q \n" | gmx make_ndx -f solion.gro -o index.ndx

gmx grompp -f em_real.mdp -c solion.gro -p topol.top -n index.ndx -o em.tpr -maxwarn 1
gmx mdrun -v -deffnm em

gmx grompp -f NVT.mdp -c em.gro -p topol.top -n index.ndx -o NVT.tpr -maxwarn 1 
gmx mdrun -deffnm NVT -nb gpu -v


gmx grompp -f NPT.mdp -c NVT.gro -t NVT.cpt -p topol.top -n index.ndx -o NPT.tpr -maxwarn 2
gmx mdrun -deffnm NPT -nb gpu -v

gmx grompp -f MD.mdp -c NPT.gro -t NPT.cpt -p topol.top -n index.ndx -o MD.tpr -maxwarn 2
gmx mdrun -deffnm MD -nb gpu -v

cd ..
